#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <mpi.h>

#define SEED     921
#define NUM_ITER 1000000000

int main(int argc, char* argv[])
{
    int count = 0;
    double x, y, z, pi, *results;
    int rank, size, i, provided;

    double t1, t2, t;

    MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
    t1 = MPI_Wtime();

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    printf("My rank %d of %d\n", rank, size);


    // Define my value
    srand(SEED*rank); // Important: Multiply SEED by "rank" when you introduce MPI!

    MPI_Win win;
    double *window_pi;
    //MPI_Alloc_mem(size*sizeof(double), MPI_INFO_NULL, &window_pi);
    MPI_Win_allocate(size*sizeof(double), sizeof(double), MPI_INFO_NULL, MPI_COMM_WORLD, &window_pi,  &win);


    // Calculate PI following a Monte Carlo method
    for (int iter = 0; iter < NUM_ITER/size; iter++)
    {
        // Generate random (X,Y) points
        x = (double)random() / (double)RAND_MAX;
        y = (double)random() / (double)RAND_MAX;
        z = sqrt((x*x) + (y*y));

        // Check if point is in unit circle
        if (z <= 1.0)
        {
            count++;
        }
    }

    // Estimate Pi and display the result
    window_pi[rank] = ((double)count / (double)(NUM_ITER/size)) * 4.0;

    if(rank > 0)
    {
        // Push my value into the first integer in MPI process 1 window
        MPI_Put(&(window_pi[rank]), 1, MPI_DOUBLE, 0, rank, size, MPI_DOUBLE, win);
    }


    MPI_Win_fence(0, win);
    for (int i = 0; i < size; i++)
    {
      printf("The mem value at %d is %f\n", i, window_pi[i]);
    }
    if(rank == 0)
    {
      //Take average of pi values
      double sum = 0, average = 0;
      for (int i = 0; i < size; i++)
      {
        sum += window_pi[i];
      }
      average = sum/size;
      printf("The Final result is %f\n", average);
    }
    MPI_Win_free(&win);
    MPI_Free_mem(window_pi);


    t2 = MPI_Wtime();

	t = t2-t1;
	double time_spent = 0;
    MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	if(rank == 0)
		printf("Total time (pi_reduce) by each process = %f  And Average = %f ", time_spent, time_spent/size);

    printf("MPI_Wtime measured (pi_reduce) for total run to be: %f\n", t2-t1);

    MPI_Finalize();

    return 0;
}
