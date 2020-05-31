#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <mpi.h>
#include "omp.h"

#ifndef N
#define N 6
#endif

#ifndef N_BAR
#define N_BAR 2
#endif

#ifndef OMP_THREADS
#define OMP_THREADS 2
#endif

#ifndef COMMS
#define COMMS 0
#endif

#define EPSILON 0.000001

/* Global Variable Declarations */
double MatA[N][N], MatB[N][N], MatC[N][N];

/* Function Declarations */

double mysecond()
{
	struct timeval tp;
	struct timezone tzp;
	int i;
	i = gettimeofday(&tp,&tzp);
	return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

void InitiateMatrix()
{
    srand(time(NULL) + 14876);
    for(int i = 0; i < N ; i++)
    {
        for(int j = 0; j < N ; j++)
        {
            MatA[i][j] = (double) random() / (double) RAND_MAX;
            MatB[i][j] = (double) random() / (double) RAND_MAX;
            #ifdef DEBUG
            #if DEBUG > 1  
            MatA[i][j] = j;
            MatB[i][j] = j % 2;
            #endif 
            #endif
            
            //printf("%f , %f\t",MatA[i][j], MatB[i][j]);
        }
        //printf("\n");
    }
}

void PrintMatrix(double Mat[N][N])
{
    for(int i = 0; i < N ; i++)
    {
        for(int j = 0; j < N ; j++)
        {
            printf("%.6f\t", Mat[i][j]); //Upto 6 decimal places
        }
        printf("\n");
    }
}

#ifdef DEBUG
#if DEBUG > 0
void Debug(){
    double mult[N][N];
    // Initializing elements of matrix mult to 0.
    for (int i = 0; i < N; ++i) 
    {
        for (int j = 0; j < N; ++j) 
        {
            mult[i][j] = 0;
        }
    }

    // Multiplying first and second matrices and storing in mult.
    for (int i = 0; i < N; ++i) 
    {
        for (int j = 0; j < N; ++j) 
        {
            for (int k = 0; k < N; ++k) 
            {
                mult[i][j] += MatA[i][k] * MatB[k][j];
            }
        }
    }

    // Verify multiplication worked correct
    int matches = 1;
    for (int i = 0; i < N; ++i) 
    {
        for (int j = 0; j < N; ++j) 
        {
            matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
            if (!matches)
                break;
        }
    }
    if (matches)
        printf("The results Matches\n");
    else
        printf("The results do not match\n");
}
#endif 
#endif

int main(int argc, char* argv[]) {
    int rank, size, provided;
    int q, n_bar;      // num procs per row and per col
    
    double t1, t2, t, size_root;
    InitiateMatrix();
    
    MPI_Init_thread(&argc, &argv, MPI_THREAD_FUNNELED, &provided);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    //printf("My rank %d of %d\n", rank, size);
    double TA, TB, TComm = 0;
    t1 = MPI_Wtime();
    size_root = sqrt((double) size);
    q = (int) size_root;
    n_bar = N/q;
    if (!((N % q == 0) && (size_root == round(size_root))))
    {
        printf("Incorrect number of Process alocated, refer instructions for correct # of Process");
        MPI_Finalize();
        return 49;
    }

    // Define boundaries for processing
    int dims[2] = {0, 0};               // Ask MPI to decompose our processes in a 2D cartesian grid for us
    MPI_Dims_create(size, 2, dims);
    int periods[2] = {1, 1};      //Mesh Topology, set to True for Torus Topology
    int reorder = 1;                 // Let MPI assign arbitrary ranks if it deems it necessary
    MPI_Comm cart_comm;          // Create a communicator with a cartesian topology.
    MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &cart_comm);

    // Get my rank in the new communicator
    int cart_rank;
    MPI_Comm_rank(cart_comm, &cart_rank);
    int x = cart_rank / q;
    int y = cart_rank % q;

    int row = x; // Determine color based on row
    // Split the communicator based on the color and use the original rank for ordering
    MPI_Comm row_comm;
    MPI_Comm_split(cart_comm, row, cart_rank, &row_comm);

    int row_rank, row_size;
    MPI_Comm_rank(row_comm, &row_rank);
    MPI_Comm_size(row_comm, &row_size);

    //printf("My world rank = %d Cartesian Rank = %d X = %d Y = %d row_rank = %d row_size = %d \n", rank, cart_rank, x, y, row_rank, row_size);

    //Setting up roll in Vertical direction for B
    int receive_from, send_to;
    MPI_Cart_shift(cart_comm, 0, 1, &send_to, &receive_from);

    //tiling Size descriptors
    double  BufMatA[N_BAR][N_BAR] __attribute__ ((aligned)), BufMatB[N_BAR][N_BAR] __attribute__ ((aligned)), 
            BufMatBtemp[N_BAR][N_BAR] __attribute__ ((aligned)), BufMatC[N_BAR][N_BAR] __attribute__ ((aligned)) ={0}; //Local Buffers
   /* 
    for (int j = 0; j < N_BAR; j++) //Generate B Tile
    {
        for (int i = 0; i < N_BAR; i++)
        {
            BufMatB[j][i] = MatB[x*N_BAR + j][y*N_BAR + i];
        }
    } */
    omp_set_num_threads(OMP_THREADS);
    #pragma omp parallel for schedule(static)
    for (int j = 0; j < N_BAR; j++) //Generate B Tile
    {
        for (int i = 0; i < N_BAR; i++)
        {
            BufMatB[i][j] = MatB[x*N_BAR + j][y*N_BAR + i]; //Transposed matrix generation
        }
    }
    
    for(int i = 0; i < q; i++) //Control stages and compute multiple for the submatrices **Should not be mulltithreaded**
    {
        if ((x + i) % row_size == y) //True if this is sender
        {
            #pragma omp parallel for schedule(static)
            for (int j = 0; j < N_BAR; j++) //Generate A Tile
            {
                for (int i = 0; i < N_BAR; i++)
                {
                    BufMatA[j][i] = MatA[x*N_BAR + j][y*N_BAR + i];
                }
                
            }
            #if COMMS > 0
            TA = mysecond();
            #endif
            MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,row_rank, row_comm);
            #if COMMS > 0
            TB = mysecond();
            TComm += TB-TA;
            #endif
        }
        else
        {
            #if COMMS > 0
            TA = mysecond();
            #endif
            MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,(x + i) % row_size, row_comm);
            #if COMMS > 0
            TB = mysecond();
            TComm += TB-TA;
            #endif
        }
        //multiply utilizing transposed B tile
        double sum = 0;
        for (int c = 0 ; c < N_BAR ; c++ )
        {
            #pragma omp for schedule(static)
            for (int d = 0 ; d < N_BAR ; d++ )
            {
                #pragma omp simd reduction(+:sum)   //Vectorize the loop here
                for (int k = 0 ; k < N_BAR ; k++ )
                {
                sum += BufMatA[c][k]*BufMatB[d][k];
                }
                BufMatC[c][d] += sum;
                #ifdef DEBUG
                #if DEBUG > 2  
                printf("%f\t", BufMatC[c][d]);
                #endif 
                #endif
                sum = 0;
            }
            #ifdef DEBUG
            #if DEBUG > 2  
            printf("\n");
            #endif 
            #endif
        }
        //Roll B data upwards
        #if COMMS > 0
        TA = mysecond();
        #endif
        MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
                        BufMatBtemp,  N_BAR*N_BAR, MPI_DOUBLE, receive_from,  0, cart_comm, MPI_STATUS_IGNORE);
        #if COMMS > 0
        TB = mysecond();
        TComm += TB-TA;
        #endif
        
        memcpy(BufMatB, BufMatBtemp,  N_BAR*N_BAR*sizeof(double));
    }
    
    
    int sizes[2] = {N,N};
    int subsizes[2] = {N_BAR,N_BAR};
    int starts[2] = {0,0};
    
    MPI_Datatype block2d;
    MPI_Type_contiguous(N_BAR*N_BAR, MPI_DOUBLE, &block2d);
    MPI_Type_commit(&block2d);

    MPI_Datatype recvsubarray;
    MPI_Type_create_subarray(2,sizes,subsizes,starts,MPI_ORDER_C,MPI_DOUBLE,&recvsubarray);
    MPI_Type_commit(&recvsubarray);

    MPI_Datatype resizedrecvsubarray;
    MPI_Type_create_resized(recvsubarray, 0, 1*sizeof(double), &resizedrecvsubarray);
    MPI_Type_commit(&resizedrecvsubarray);

    int counts[]= { [0 ... (N*N/(N_BAR*N_BAR)-1)] = 1 };
    int disps[N*N/(N_BAR*N_BAR)]; //Calculate the displacements for the incoming Submatrices
    for (int i = 0; i < size; i++)
    { 
        disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
    }
    #if COMMS > 0
    TA = mysecond();
    #endif
    MPI_Gatherv(BufMatC,1,block2d,MatC,counts,disps,resizedrecvsubarray,0,MPI_COMM_WORLD);
    #if COMMS > 0
    TB = mysecond();
    TComm += TB-TA;
    #endif
    //Time the code
    t2 = MPI_Wtime();
    t = t2-t1;
    printf("MPI_Wtime measured for total run by process %d = %f\n", rank, t);
	double time_spent = 0;
    MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	#if COMMS > 0
    MPI_Reduce(&TComm, &Comm_time, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
    #endif
    if(rank == 0)
		printf("Total time by each process = %f  And Average = %f , Comm_TIME = %f", time_spent, time_spent/size, Comm_time/size);
	
    if (rank == 0)
    {
        //FOllowing lines can be uncommented incase you want to look into the output.
        // printf("\nPrinting Matrix A\n");
        // PrintMatrix(MatA);
        // printf("\nPrinting Matrix B\n");
        // PrintMatrix(MatB);
        // printf("\nPrinting Matrix C\n");
        //PrintMatrix(MatC);

        #ifdef DEBUG
        #if DEBUG > 0  
        Debug();
        #endif 
        #endif
        
    }
    MPI_Finalize();
    return 0;
}
