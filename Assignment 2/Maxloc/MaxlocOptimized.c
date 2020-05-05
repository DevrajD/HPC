#include "stdlib.h" // rand for instance.
#include "omp.h"
# include <stdio.h>
# include <sys/time.h>
#include <math.h>

#define N 1000000
#define ITERATIONS 1000

int MAX_THREADS=4;
int lis[]={1,2,4,8,16, 20, 24, 28, 32};

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
	srand(0);//time(0)); // seed
	double x[N];
	int i,j,k;
	double t1, t2;
	int mloc;
	double mval;
	float data_time[ITERATIONS],avg_time=0;;

  #pragma omp parallel for
  for( i=0; i < N;i++){
    x[i] = ((double)(rand()) / RAND_MAX)*((double)(rand()) / RAND_MAX)*((double)(rand()) / RAND_MAX)*1000;
  }

  for(i=0;i<9;i++)
  {
    MAX_THREADS = lis[i];
    omp_set_num_threads(MAX_THREADS);
  	printf("Threads = %d\ni = %d\n", omp_get_max_threads(),i);
    avg_time=0;
  	typedef struct {double val; int loc;char pad[64]; } tvals;
  	tvals *maxinfo;//[MAX_THREADS];
    maxinfo = (tvals*)malloc(MAX_THREADS*sizeof(tvals));
  	//maxinfo = (tvals*) malloc(sizeof(tvals)*getenv("OMP_NUM_THREADS"));

  	for(j=0;j<ITERATIONS;j++)
    {
    	t1 = mysecond();
    	#pragma omp parallel shared(maxinfo)
    	{
    		int id = omp_get_thread_num();
    		maxinfo[id].val = -1.0e30;
    		#pragma omp for
    		for( k=0; k < N;k++)
        {
    			if (x[k] > maxinfo[id].val)
          {
    				maxinfo[id].loc = k;
    				maxinfo[id].val = x[k];
    			}
    		}
    	}

    	mloc = maxinfo[0].loc;
    	mval = maxinfo[0].val;
    	for (k = 1; k<MAX_THREADS; k++)
      {
    		if (maxinfo[k].val > mval)
        {
    			mval = maxinfo[k].val;
    			mloc = maxinfo[k].loc;
    		}
    	}
    	t2 = mysecond();
    	data_time[j] = t2-t1;
      avg_time+=t2-t1;
  	}
    free(maxinfo);
    #pragma omp critical
  	printf("time = %f\nMaxloc = %d\nMaxVal=%f\nSD = %f\n", avg_time/ITERATIONS,mloc,mval,calculateSD(data_time));
  }
	return 0;
}
