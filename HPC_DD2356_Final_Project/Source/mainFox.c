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

void PrintMatrix(double* Mat)
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

/* Global Variable Declarations */
double MatA[N][N], MatB[N][N]; 

int main(int argc, char* argv[]) {
    int size;   // num procs
    int rank;   // my rank
    int q;      // num procs per row and per col
    int n_bar;  // block order (block is n_bar by n_bar)


    {
        MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
        MPI_Comm_size(MPI_COMM_WORLD, &size);
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);
        printf("My rank %d of %d\n", rank, size);
    }
    t1 = MPI_Wtime();

    q = (int) sqrt((double) size);
    if (q != N )
    {
        printf("Incorrect number of Process alocated, must be %d", (int)N*N);
        MPI_Finalize();
        return NULL;
    }

    // Define boundaries for processing
    int dims[2] = {0, 0};               // Ask MPI to decompose our processes in a 2D cartesian grid for us
    MPI_Dims_create(size, 2, dims);
    int periods[2] = {true, true};      //Mesh Topology, set to True for Torus Topology
    int reorder = true;                 // Let MPI assign arbitrary ranks if it deems it necessary
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

        printf("My world rank = %d Cartesian Rank = %d X = %d Y = %d row_rank = %d row_size = %d", rank, cart_rank, x, y, row_rank, row_size);
    }

    
   
    MPI_Finalize();
    return 0;
}


    

/*********************************************************/
void Foxy(
        LOCAL_MATRIX_T*  local_A   /* in  */,
        LOCAL_MATRIX_T*  local_B   /* in  */,
        LOCAL_MATRIX_T*  local_C   /* out */,
        MPI_Comm         comm      /* in, communicator */) {

    LOCAL_MATRIX_T*  temp_A; /* Storage for the sub-    */
                             /* matrix of A used during */ 
                             /* the current stage       */
    LOCAL_MATRIX_T*  temp_B; /* Storage for the sub-    */
                             /* matrix of B during rotation of B blocks */ 
    int              s; // index of current stage
    int              tag = 0;
    MPI_Status       status;
    int              p; // numprocs
    int              q; // procs per row, per col
    int              r; // my rank
    int              i; // r / q, my row index 
    int              j; // r % q, my col index 
    int              k;
    float*           temp_old_B_entries;
    float*           temp_new_B_entries;

    MPI_Comm_rank(comm, &r);
    MPI_Comm_size(comm, &p);
    q = (int) sqrt((double) p);
    i = r / q; 
    j = r % q;

    Set_to_zero(local_C);

    /* Set aside storage for the broadcast block of A */
    temp_A = Local_matrix_allocate(Order(local_A));
    Order(temp_A) = Order(local_A);
    Build_matrix_type(temp_A); // builds local_matrix_mpi_t

    for (s = 0; s < q; ++s) {
        //printf("proc %d = (%d, %d) enter stage %d\n", r, i, j, s); fflush(stdout);
	/// 1. Bcast A[i,i+s] to all in row i.
        if (j == ((i + s)%q)) { // I'm the bcast sender
            for (k = 0; k < q; ++k)
                if (k != j)  
                    MPI_Send(local_A, 1, local_matrix_mpi_t,
                         /* destination */ i*q + k, tag, comm);

            /// C[i,j] += A[i,i+s]*B[i+s,j]
            Local_matrix_multiply(local_A, local_B, local_C);

        } else { // recv the A[i,i+s] block
            MPI_Recv(temp_A, 1, local_matrix_mpi_t,
                /* source */ i*q + (i + s)%q, tag, comm, &status);

            /// C[i,j] += A[i,i+s]*B[i+s,j]
            Local_matrix_multiply(temp_A, local_B, local_C);
        }

        //printf("proc %d = (%d, %d) multiplied in stage %d\n", r, i, j, s); fflush(stdout);
        /// 3. Calculate addresses for circular shift of B 
	/// proc r = i*q + j now has B[i+s, j], 
	/// but it wants B[i+s+1,j] in preparation for next stage.

        if (0 == (i % 2)) {
            MPI_Send(local_B, 1, local_matrix_mpi_t,
                /* dest below */ ((i - 1 + q)%q)*q + j, tag, comm);
            MPI_Recv(local_B, 1, local_matrix_mpi_t,
                /* source above */ ((i + 1)%q)*q + j, tag, comm, &status);
        } else {
            temp_B = Local_matrix_allocate(Order(local_B));
            Order(temp_B) = Order(local_B);
	    for (k = 0; k < Order(local_B); ++k) temp_B->entries[k] = local_B->entries[k];

            MPI_Recv(local_B, 1, local_matrix_mpi_t,
                /* source above */ ((i + 1)%q)*q + j, tag, comm, &status);

            MPI_Send(temp_B, 1, local_matrix_mpi_t,
                /* dest below */ ((i - 1 + q)%q)*q + j, tag, comm);
        }
/*
        // works on global comm?   -- no
        MPI_Sendrecv_replace(local_B, 1, local_matrix_mpi_t,
            i*q + dest_col, tag, i*q + source_col, tag, comm, &status);
*/
    } /* for s */
    
} /* Fox */

