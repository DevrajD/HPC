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

    MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

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

    MPI_Request requestS;
    if(rank > 0)
      MPI_Isend(&pi, 1, MPI_DOUBLE, 0, 0, MPI_COMM_WORLD, &requestS);
    else
    {
      MPI_Request *request;
      request = (MPI_Request*) malloc(size*sizeof(MPI_Request));

      MPI_Status *status;
      status = (MPI_Status*) malloc(size*sizeof(MPI_Status));

      //Set Pi value into the array
      results[0] = pi;
      //Receive the Pi values
      for (int i = 1; i < size; i++) {
        MPI_Irecv(&results[i], 1, MPI_DOUBLE, i, 0, MPI_COMM_WORLD, request);
      }
      MPI_Waitall(size, request, MPI_STATUSES_IGNORE);
      //Take average of pi values
      double sum = 0, average = 0;
      for (int i = 0; i < size; i++)
      {
        sum += results[i];
      }
      average = sum/size;
      printf("The result is %f\n", average);
    }

    MPI_Finalize();

    return 0;
}