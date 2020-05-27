#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <mpi.h>

#ifndef N
#define N 3
#endif

/* Global Variable Declarations */
double MatA[N][N], MatB[N][N];

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
        }
    }
}

void PrintMatrix(double** Mat)
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

void multiplyMatrices(double* A, double* B, double* C, int n) 
{
    memset(C, 0, n*n*sizeof(double)); 
    // Multiplying first and second matrices and storing in mult.
    for (int i = 0; i < r1; ++i) {
        for (int j = 0; j < c2; ++j) {
            for (int k = 0; k < c1; ++k) {
                mult[i][j] += first[i][k] * second[k][j];
            }
        }
    }
}

void multiplyMatrices(double* a, double* b, double* C, int n) 
{

    //memset(C, 0, n*n*sizeof(double)); 

    for (int i = 0; i < n; i++) 
    {
        for (int j = 0; j < n; j++) 
        {
            int sum = 0;
            for (int k = 0; k < n; k++)
                sum = sum + a[i * n + k] * b[k * n + j];
            C[i * n + j] = sum;
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
}


int main(int argc, char* argv[]) {
    int rank, size, provided;
    int q;      // num procs per row and per col
    int n_bar;  // block order (block is n_bar by n_bar)
    double t1, size_root;

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
    if ((N % q == 0) && (size_root == round(size_root)))
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

    // Declare our neighbours
    enum DIRECTIONS {DOWN, UP, LEFT, RIGHT};
    char* neighbours_names[4] = {"down", "up", "left", "right"};
    int neighbours_ranks[4];

    //keep in mind that for MPI dimension 0 is for 'columns' and 1 is for 'rows' (like in Fortran). For more information see here.
    //MPI_Cart_shift(cart_comm, 0, 1, &neighbours_ranks[LEFT], &neighbours_ranks[RIGHT]);  // Let consider dims[0] = X, so the shift tells us our left and right neighbours
    //MPI_Cart_shift(cart_comm, 1, 1, &neighbours_ranks[DOWN], &neighbours_ranks[UP]);     // Let consider dims[1] = Y, so the shift tells us our up and down neighbours

    // Get my rank in the new communicator
    int cart_rank;
    MPI_Comm_rank(cart_comm, &cart_rank);

    {
        int x = cart_rank / q;
        int y = cart_rank % q;

        int row = x; // Determine color based on row

        // Split the communicator based on the color and use the
        // original rank for ordering
        MPI_Comm row_comm;
        MPI_Comm_split(cart_comm, row, cart_rank, &row_comm);

        int row_rank, row_size;
        MPI_Comm_rank(row_comm, &row_rank);
        MPI_Comm_size(row_comm, &row_size);

        printf("My world rank = %d Cartesian Rank = %d X = %d Y = %d row_rank = %d row_size = %d \n", rank, cart_rank, x, y, row_rank, row_size);

        //tiling Size descriptors
        double* BufA, BufB, BufC;
        BufA=(double*)malloc(n_bar*n_bar*sizeof(double));
        BufB=(double*)malloc(n_bar*n_bar*sizeof(double));
        BufC=(double*)calloc(n_bar*n_bar, sizeof(double)); //Initiate and set zero
        //Looping
        


        for(int i = 0; i < N; i++) //Control stages
        {
            if (x + i == y) //True if this is sender
            {
                for (int j = 0; j < n_bar; j++) //Generate A Tile
                {
                    memcpy(&BufA[j*n_bar],&MatA[x*n_bar + j][y*n_bar],n_bar); //x, y coordinates
                }
                MPI_Bcast(BufA,n_bar*n_bar,MPI_DOUBLE,row_rank, row_comm);
            }
            else
            {
                MPI_Bcast(BufA,n_bar*n_bar,MPI_DOUBLE,(x % row_size)+i, row_comm);
            }

            for (int j = 0; j < n_bar; j++) //Generate B Tile
            {
                memcpy(&BufB[j*n_bar],&MatB[x*n_bar + j][y*n_bar],n_bar); //x, y coordinates
            }
            multiplyMatrices(BufA, BufB, BufC, n_bar);
        }

    }



    MPI_Finalize();
    return 0;
}
