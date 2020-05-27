/**
 * @author RookieHPC
 * @brief Original source code at https://www.rookiehpc.com/mpi/docs/mpi_cart_shift.php
 **/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <mpi.h>
 
/**
 * @brief Illustrates how to use the MPI_Cart_shift routine.
 * @details This code creates a cartesian topology, then retrieves the rank of
 * up/down left/right neighbours via a shift.
 * For readability reasons, it is advised to run this code with 4 processes. The
 * toplogy created, given 4 processes, can be visualised as:
 *      +-----------+-----------+
 *      |           |           |
 *    ^ | process 1 | process 3 |
 *    | |           |           |
 * UP | +-----------+-----------+
 *    | |           |           |
 *    | | process 0 | process 2 |
 *      |           |           |
 *      +-----------------------+
 *        ------------------->
 *                RIGHT
 **/
int main(int argc, char* argv[])
{
    MPI_Init(&argc, &argv);
 
    // Size of the default communicator
    int size;
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    if(size != 4)
    {
        printf("This application is meant to be run with 4 processes, not %d.\n", size);
        MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
    }
 
    // Ask MPI to decompose our processes in a 2D cartesian grid for us
    int dims[2] = {0, 0};
    MPI_Dims_create(size, 2, dims);
 
    // Make both dimensions periodic
    int periods[2] = {true, true};
 
    // Let MPI assign arbitrary ranks if it deems it necessary
    int reorder = true;
 
    // Create a communicator with a cartesian topology.
    MPI_Comm new_communicator;
    MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &new_communicator);
 
    int old_ranksx, new_ranksx, old_ranksy, new_ranksy;
    
 
    // Let consider dims[0] = X, so the shift tells us our left and right neighbours
    MPI_Cart_shift(new_communicator, 0, 1, &old_ranksx, &new_ranksx);
 
    // Let consider dims[1] = Y, so the shift tells us our up and down neighbours
    MPI_Cart_shift(new_communicator, 1, 1, &old_ranksy, &new_ranksy);
 
    // Get my rank in the new communicator
    int my_rank;
    MPI_Comm_rank(new_communicator, &my_rank);
    printf("My rank = %d \t Old rankx = %d \t New Rankx = %d\t Old ranky = %d \t New Ranky = %d\t", my_rank, old_ranksx, new_ranksx, old_ranksy , new_ranksy);
 
    
 
    MPI_Finalize();
 
    return EXIT_SUCCESS;
}
