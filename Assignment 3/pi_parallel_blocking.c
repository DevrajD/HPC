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

    if(rank == 0)
      results = (double*) malloc(size*sizeof(double));

    srand(SEED*rank); // Important: Multiply SEED by "rank" when you introduce MPI!

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
    pi = ((double)count / (double)(NUM_ITER/size)) * 4.0;

    if(rank > 0)
      MPI_Send(&pi, 1, MPI_DOUBLE, 0, 0, MPI_COMM_WORLD);
    else
    {
      //Set Pi value into the array
      results[0] = pi;
      //Receive the Pi values
      for (int i = 1; i < size; i++) {
        MPI_Recv(&results[i], 1, MPI_DOUBLE, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      }
      //Take average of pi values
      double sum = 0, average = 0;
      for (int i = 0; i < size; i++)
      {
        sum += results[i];
      }
      average = sum/size;
      printf("The Final result is %f\n", average);
    }
    t2 = MPI_Wtime();
	
	t = t2-t1;
	double time_spent = 0;
    MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	if(rank == 0)
		printf("Total time (pi_parallel_blocking) by each process = %f  And Average = %f ", time_spent, time_spent/size);
	
    printf("MPI_Wtime measured (pi_parallel_blocking) for total run to be: %f\n", t2-t1);

    MPI_Finalize();
    return 0;
}
