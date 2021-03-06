#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <mpi.h>
#include "mkl.h"

#ifndef N
#define N 6
#endif

#ifndef N_BAR
#define N_BAR 2
#endif

#define EPSILON 0.000001

/* Global Variable Declarations */
double MatA[N][N], MatB[N][N], MatC[N][N];

/* Function Declarations */
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
void PrintMatrixBuf(double* buf)
{
    for(int i = 0; i < N_BAR ; i++)
    {
        for(int j = 0; j < N_BAR ; j++)
        {
            printf("%.6f\t", buf[i*N_BAR + j]); //Upto 6 decimal places
        }
        printf("\n");
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
void multiplyMatrices(double* a, double* b, double* C, int n) 
{
    for (int i = 0; i < n; i++) 
    {
        for (int j = 0; j < n; j++) 
        {
            for (int k = 0; k < n; k++)
                C[i * n + j] += a[i * n + k] * b[k * n + j]; //Accumulate the results here
        }
    }
    /*
    for (int i = 0; i < n*n; i++) 
    {
        if (i % n == 0) 
        {
            printf("\n");
        }
        printf("%f ", C[i]);
    }
    printf("\n");
    */
}
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

int main(int argc, char* argv[]) {
    int rank, size, provided;
    int q, n_bar;      // num procs per row and per col
    
    double t1, t2, t, size_root;
    InitiateMatrix();
    
    MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    //printf("My rank %d of %d\n", rank, size);
    
    t1 = MPI_Wtime();
    size_root = sqrt((double) size);
    q = (int) size_root;
    n_bar = N/q;
    if (!((N % q == 0) && (size_root == round(size_root))))
    {
        printf("Incorrect number of Process alocated, refer instructions for correct # of Process");
        MPI_Finalize();
        return 1;
    }

    // Define boundaries for processing
    int dims[2] = {0, 0};               // Ask MPI to decompose our processes in a 2D cartesian grid for us
    MPI_Dims_create(size, 2, dims);
    int periods[2] = {1, 1};            //Mesh Topology, set to True for Torus Topology
    int reorder = 1;                    // Let MPI assign arbitrary ranks if it deems it necessary
    MPI_Comm cart_comm;                 // Create a communicator with a cartesian topology.
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
    //double BufMatA[N_BAR][N_BAR], BufMatB[N_BAR][N_BAR], BufMatBtemp[N_BAR][N_BAR], BufMatC[N_BAR][N_BAR]={0}; //Local Buffers
    double *BufMatA, *BufMatB, *BufMatC, *BufMatBtemp;
    //Allocating memory for matrices aligned on 64-byte boundary for better performance
   /*  BufMatA = (double *)mkl_malloc( N_BAR*N_BAR*sizeof( double ), 64 );
    BufMatB = (double *)mkl_malloc( N_BAR*N_BAR*sizeof( double ), 64 );
    BufMatBtemp = (double *)mkl_malloc( N_BAR*N_BAR*sizeof( double ), 64 );
    BufMatC = (double *)mkl_malloc( N_BAR*N_BAR*sizeof( double ), 64 ); */
    BufMatA = (double *)malloc( N_BAR*N_BAR*sizeof( double ));
    BufMatB = (double *)malloc( N_BAR*N_BAR*sizeof( double ));
    BufMatBtemp = (double *)malloc( N_BAR*N_BAR*sizeof( double ));
    BufMatC = (double *)malloc( N_BAR*N_BAR*sizeof( double ));
    double alpha = 1, beta = 0.0;
    if (BufMatA == NULL || BufMatB == NULL || BufMatC == NULL || BufMatBtemp == NULL) 
    {
        printf( "\n ERROR: Can't allocate memory for matrices. Aborting... \n\n");
        mkl_free(BufMatA);
        mkl_free(BufMatB);
        mkl_free(BufMatC);
        return 1;
    }
    
    for (int j = 0; j < N_BAR; j++) //Generate B Tile
    {
        for (int i = 0; i < N_BAR; i++)
        {
            BufMatB[j*N_BAR+i] = MatB[x*N_BAR + j][y*N_BAR + i];
        }
    }
    
    for(int i = 0; i < q; i++) //Control stages and compute multiple for the submatrices
    {
        if ((x + i) % row_size == y) //True if this is sender
        {
            for (int j = 0; j < N_BAR; j++) //Generate A Tile
            {
                for (int i = 0; i < N_BAR; i++)
                {
                    BufMatA[j*N_BAR + i] = MatA[x*N_BAR + j][y*N_BAR + i];
                }
                
            }
            MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,row_rank, row_comm);
        }
        else
        {
            MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,(x + i) % row_size, row_comm);
        }
        //multiply usin MKL dgemm
        cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, 
                    N_BAR, N_BAR, N_BAR, alpha, BufMatA, N_BAR, BufMatB, N_BAR, beta, BufMatC, N_BAR);
        
        //Roll B data upwards
        MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
                        BufMatBtemp,  N_BAR*N_BAR, MPI_DOUBLE, receive_from,  0, cart_comm, MPI_STATUS_IGNORE);

        memcpy(BufMatB, BufMatBtemp,  sizeof(BufMatB));
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

    MPI_Gatherv(BufMatC,1,block2d,MatC,counts,disps,resizedrecvsubarray,0,MPI_COMM_WORLD);

    //Time the code
    t2 = MPI_Wtime();
    t = t2-t1;
    printf("MPI_Wtime measured for total run by process %d = %f\n", rank, t);
	double time_spent = 0;
    MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	if(rank == 0)
		printf("Total time by each process = %f  And Average = %f ", time_spent, time_spent/size);
	
    if (rank == 0)
    {
        printf("\nPrinting Matrix A\n");
        PrintMatrix(MatA);
        printf("\nPrinting Matrix B\n");
        PrintMatrix(MatB);
        printf("\nPrinting Matrix C\n");
        PrintMatrix(MatC);

        #ifdef DEBUG
        #if DEBUG > 0  
        Debug();
        #endif  
        #endif
        
    }
    mkl_free(BufMatA);
    mkl_free(BufMatB);
    mkl_free(BufMatC);

    MPI_Finalize();
    return 0;
}
