#include <string.h>
#include <stdio.h>
#include <math.h>
#include "stdlib.h" // malloc and rand for instance. Rand not thread safe!
#include <sys/time.h>
#include <omp.h>

#define DIM 3
#define N 1000
#define G 1
#define DELTA_T 0.001
#define TIME_STEPS 100
#define TRIALS 10

typedef struct vec {
   double x;
   double y;
   double z; //For cache line size of 64 in two parts
} vector;

vector force[N][N]={0};
vector force_total[N]={0};
vector vel[N];
vector pos[N];
vector old_pos[N];

double mass[N]={0};
double posX[N];
double posY[N];
double posZ[N];
double old_posX[N];
double old_posY[N];
double old_posZ[N];

void Calc()
{
  int i, j;
  double  distX, distY, distZ,
          distX2, distY2, distZ2,
          Xf,Yf,Zf,
          total_dist, dist_cubed, GG;

  //#pragma omp parallel for private(j)
  for (i = 0; i < N; i++)
  {
    Xf=0;Yf=0;Zf=0;
    //#pragma omp parallel for private(distX, distY, distZ,distX2, distY2, distZ2,total_dist,dist_cubed,GG) reduction(-:Xf,Yf,Zf)
    for (j = 0; j < N; j++)
      if (i != j)
      {
        distX = posX[i]-posX[j];
        distY = posY[i]-posY[j];
        distZ = posZ[i]-posZ[j];

        distX2 = distX*distX;
        distY2 = distY*distY;
        distZ2 = distZ*distZ;

        total_dist = sqrt(distX2+distY2+distZ2);
        dist_cubed = total_dist*total_dist*total_dist;
        GG = G*mass[i]/dist_cubed;
        //Race condition here
        Xf -= GG*distX;
        Yf -= GG*distY;
        Zf -= GG*distZ;
      }
    //#pragma omp critical
    {
      force_total[i].x = Xf;
      force_total[i].y = Yf;
      force_total[i].z = Zf;
    }
  }
}

void ending()
{
  int i;
  //#pragma omp parallel for
  for(i=0;i<DIM;i++)
  {
    vel[i].x = DELTA_T/mass[i]*force_total[i].x;
    vel[i].y = DELTA_T/mass[i]*force_total[i].y;
    vel[i].z = DELTA_T/mass[i]*force_total[i].z;
    old_pos[i].x = pos[i].x;
    old_pos[i].y = pos[i].y;
    old_pos[i].z = pos[i].z;
    pos[i].x = DELTA_T*vel[i].x;
    pos[i].y = DELTA_T*vel[i].y;
    pos[i].z = DELTA_T*vel[i].z;
  }
}

float calculateSD(double data[]) {
    double sum = 0.0, mean, SD = 0.0;
    int i;
    for (i = 0; i < TRIALS; ++i) {
        sum += data[i];
    }
    mean = sum / TRIALS;
    for (i = 0; i < TRIALS; ++i)
        SD += pow(data[i] - mean, 2);
    return sqrt(SD / TRIALS);
}

int main (int argc, char *argv[]) {
  printf("MAX Threads = %d\n", omp_get_max_threads());

  //Var Declarations

  int i,j;
  double t1[TRIALS], t2[TRIALS],tD[TRIALS], t=0;
  /*Initialization*/
  //#pragma omp parallel for
  for(i=0;i<N;i++)
  {

    posX[i] = (rand() / (double)(RAND_MAX)) * 2 - 1;
    posY[i] = (rand() / (double)(RAND_MAX)) * 2 - 1;
    posZ[i] = (rand() / (double)(RAND_MAX)) * 2 - 1;
    old_posX[i] = posX[i];
    old_posY[i] = posY[i];
    old_posZ[i] = posZ[i];
    posX[i] = (rand() / (double)(RAND_MAX)) * 2 - 1;
    posY[i] = (rand() / (double)(RAND_MAX)) * 2 - 1;
    posZ[i] = (rand() / (double)(RAND_MAX)) * 2 - 1;

    mass[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
	}

  for(i=0;i<TRIALS; i++){
    t1[i] = omp_get_wtime();
    for(j=0;j<TIME_STEPS;j++){
      memset(force, 0, N*N*sizeof(vector));
      Calc();
      ending();
    }
    t2[i] = omp_get_wtime();
  }
  for(i=0;i<TRIALS; i++){
    t+=t2[i]-t1[i];
    tD[i]=t2[i]-t1[i];
    printf("%f - %f = \t%f\n", t2[i], t1[i], t2[i]-t1[i]);
  }
  printf("AVerage \t%f\nSTD = \t%f\n", t/TRIALS, calculateSD(tD));

}
