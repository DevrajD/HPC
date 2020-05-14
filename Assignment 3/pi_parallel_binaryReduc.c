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

    results = (double*) malloc(2*sizeof(double));

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
    pi = ((double)count / (double)NUM_ITER/size) * 4.0;

    //Set Pi value into the array
    results[0] = pi;
    results[1] = pi;
    //Gather the Pi values
    for (int i = 0; i < (int)log2(size); i++)
    {
      printf("I = %d\n", i);
      printf("Initial Pi = %f", pi);
      for (int j = 0; j < size; j=(int)(j+pow(2,i)))
      {
        printf("J = %d\n", j);
        if (rank == j)
        {
          MPI_Recv(&results[1], 1, MPI_DOUBLE, (int)(j+pow(2,i)), 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        }


        j=(int)(j+pow(2,i));
        //printf("J = %d\n", j);

        if (rank == j)
        {
          MPI_Send(&pi, 1, MPI_DOUBLE, (int)(j-pow(2,i)), 0, MPI_COMM_WORLD);
        }

        //average Pi values
        results[0] = (results[0]+results[1])/2;
        pi = results[0];
      }
    }

    t2 = MPI_Wtime();
    printf("MPI_Wtime measured for total run to be: %f\n", t2-t1);

    if (rank == 0)
      printf("The result is %f\n", pi);

    MPI_Finalize();
    printf("The Final result is %f\n", pi);


    return 0;
}
