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

    double t1, t2;

    MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
    t1 = MPI_Wtime();
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    printf("My rank %d of %d\n", rank, size);
 
 
    // Define my value
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
 
    if(rank == 0)
    {
        double *buffer;
		buffer = (double*) malloc(size*sizeof(double));
        MPI_Gather(&pi, 1, MPI_DOUBLE, buffer, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);
		double sum = 0, average = 0;
		for (int i = 0; i < size; i++)
		{
		sum += results[i];
		}
		average = sum/size;
		printf("The Final result is %f\n", average);
    }
    else
    {
        MPI_Gather(&pi, 1, MPI_DOUBLE, NULL, 0, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    }
 
    MPI_Finalize();
 
    return 0;
}