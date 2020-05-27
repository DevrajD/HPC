#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <mpi.h>

#ifndef N
#define N 6
#endif

#ifndef N_BAR
#define N_BAR 2
#endif

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
            printf("%f , %f\t",MatA[i][j], MatB[i][j]);
        }
        printf("\n");
    }
}

void PrintMatrixBuf(double* buf)
{
    for(int i = 0; i < n_bar ; i++)
    {
        for(int j = 0; j < n_bar ; j++)
        {
            printf("%.6f\t", buf[i*n_bar + j]); //Upto 6 decimal places
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
    for (int i = 0; i < n*n; i++) 
    {
        if (i % n == 0) 
        {
            printf("\n");
        }
        printf("%f ", C[i]);
    }
    printf("\n");
}


int main(int argc, char* argv[]) {
    int rank, size, provided;
    int q, n_bar;      // num procs per row and per col
    
    double t1, size_root;
    InitiateMatrix();
    {
        MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
        MPI_Comm_size(MPI_COMM_WORLD, &size);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);
        //printf("My rank %d of %d\n", rank, size);
    }
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
    int periods[2] = {1, 1};      //Mesh Topology, set to True for Torus Topology
    int reorder = 1;                 // Let MPI assign arbitrary ranks if it deems it necessary
    MPI_Comm cart_comm;          // Create a communicator with a cartesian topology.
    MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &cart_comm);

    
    // Get my rank in the new communicator
    int cart_rank;
    MPI_Comm_rank(cart_comm, &cart_rank);

    {
        int x = cart_rank / q;
        int y = cart_rank % q;

        int row = x; // Determine color based on row
        int col = y;    
        // Split the communicator based on the color and use the
        // original rank for ordering
        MPI_Comm row_comm;
        MPI_Comm_split(cart_comm, row, cart_rank, &row_comm);
        MPI_Comm col_comm;
        MPI_Comm_split(cart_comm, col, cart_rank, &col_comm);

        int row_rank, row_size;
        MPI_Comm_rank(row_comm, &row_rank);
        MPI_Comm_size(row_comm, &row_size);

        printf("My world rank = %d Cartesian Rank = %d X = %d Y = %d row_rank = %d row_size = %d \n", rank, cart_rank, x, y, row_rank, row_size);

        //Setting up roll in Vertical direction
        int receive_from, send_to;
        MPI_Cart_shift(cart_comm, 0, 1, &send_to, &receive_from);

        //tiling Size descriptors
        double MatCbuf_row[N];
        double BufMatA[N_BAR][N_BAR], BufMatB[N_BAR][N_BAR], BufMatBtemp[N_BAR][N_BAR], BufMatC[N_BAR][N_BAR]={0};

        for (int j = 0; j < n_bar; j++) //Generate B Tile
        {
            for (int i = 0; i < n_bar; i++)
            {
                BufMatB[j][i] = MatB[x*N_BAR + j][y*N_BAR + i];
            }
        }
        
        for(int i = 0; i < q; i++) //Control stages
        {
            if ((x + i) % row_size == y) //True if this is sender
            {
                for (int j = 0; j < n_bar; j++) //Generate B Tile
                {
                    for (int i = 0; i < n_bar; i++)
                    {
                        BufMatA[j][i] = MatA[x*N_BAR + j][y*N_BAR + i];
                    }
                    
                }
                MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,row_rank, row_comm);
            }
            else
            {
                MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,(x + i) % row_size, row_comm);
            }
            //multiply
            double sum = 0;
            for (int c = 0 ; c < N_BAR ; c++ )
            {
                for (int d = 0 ; d < N_BAR ; d++ )
                {
                    for (int k = 0 ; k < N_BAR ; k++ )
                    {
                    sum = sum + BufMatA[c][k]*BufMatB[k][d];
                    }
                    BufMatC[c][d] += sum;
                    printf("%f\t", BufMatC[c][d]);
                    sum = 0;
                }
                printf("\n");
            }
            MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
                            BufMatBtemp,  N_BAR*N_BAR, MPI_DOUBLE, receive_from,  0, cart_comm, MPI_STATUS_IGNORE);
            memcpy(BufMatB, BufMatBtemp, n_bar*n_bar*sizeof(double));
        }

        
        for (int i = 0; i < q; i++)
        {
            if(row_rank == 0)
            {
                MPI_Gather(&BufMatC[i][0], N_BAR, MPI_DOUBLE, &MatCbuf_row[i*N_BAR], N_BAR, MPI_DOUBLE, 0, row_comm);
            }
            else
            {
                MPI_Gather(&BufMatC[i][0], N_BAR, MPI_DOUBLE, NULL, 0, MPI_DOUBLE, 0, row_comm);
            }
        }
        for (int i = 0; i < N; i++)
        {
            printf("%f\t",MatCbuf_row[i]);
        }
        
        for (int i = 0; i < q; i++)
        {
            if(x == 0 && row_rank == 0)
            {
                MPI_Gather(MatCbuf_row, N, MPI_DOUBLE, MatC, N_BAR, MPI_DOUBLE, 0, col_comm);
            }
            else if(row_rank == 0)
            {
                MPI_Gather(MatCbuf_row, N, MPI_DOUBLE, NULL, 0, MPI_DOUBLE, 0, col_comm);
            }
        }
        
        for (int i = 0; i < N; i++)
        {
            for (int j = 0; j < N; j++)
            {
                printf("%f",MatC[i][j]);
            }
            printf("\n");
        }
        
        
        

        //PrintMatrix(MatCbuf);
    }



    MPI_Finalize();
    return 0;
}
