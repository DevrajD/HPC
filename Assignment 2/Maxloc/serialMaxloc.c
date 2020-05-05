
#include "stdlib.h" // rand for instance.
//#include "omp.h"
#include "time.h"
#include <stdio.h>
#include <sys/time.h>
#include <math.h>
#define N 1000000
#define ITERATIONS 1000

double mysecond(){
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp,&tzp);
  return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

float calculateSD(float data[]) {
    float sum = 0.0, mean, SD = 0.0;
    int i;
    for (i = 0; i < ITERATIONS; ++i) {
        sum += data[i];
    }
    mean = sum / ITERATIONS;
    for (i = 0; i < ITERATIONS; ++i)
        SD += pow(data[i] - mean, 2);
    return sqrt(SD / ITERATIONS);
}

int main(int argc, char* argv[]){
	srand(time(0)); // seed
	double x[N];
	int i,j;
	double t1, t2;
	double maxval = -1.0e30; int maxloc = 0;
	float data_time[ITERATIONS],avg_time=0;;


	for( i=0; i < N;i++){
		x[i] = ((double)(rand()) / RAND_MAX)*((double)(rand()) / RAND_MAX)*((double)(rand()) / RAND_MAX)*1000;
	}
	for(j=0;j<ITERATIONS;j++)
  {
    t1 = mysecond();
    for (int i=0; i < N; i++){
       if (x[i] > maxval)
       {
         maxval = x[i];
         maxloc = i;
       }
    }
    t2 = mysecond();
    data_time[j] = t2-t1;
    avg_time+=t2-t1;
	}
	printf("time = %f\nMaxloc = %d\nMaxVal=%f\nSD = %f\n", avg_time/ITERATIONS,maxloc,maxval, calculateSD(data_time));
	return 0;
}
