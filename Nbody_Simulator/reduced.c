#include <string.h>
#include <stdio.h>
#include <math.h>
#include "stdlib.h" // malloc and rand for instance. Rand not thread safe!
#include <sys/time.h>

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

void summer()
{
  int i, j;
  //vector temp;
  for(i = 0; i<N; i++)
  {
    //vec_dat(&force_total[i],0,0,0);
    memset(&force_total[i], 0, sizeof(vector));
    //force_total[i].x = 0;
    //force_total[i].y = 0;
    //force_total[i].z = 0;

    for (j=0 ; j < N; j++)
    {
      //THis has a Race condition unless handled

      force_total[i].x += force[i][j].x;
      force_total[i].y += force[i][j].y;
      force_total[i].z += force[i][j].z;
      /*
      temp.x += force[i][j].x;
      temp.y += force[i][j].y;
      temp.z += force[i][j].z;
      */

    }
    //vec_vec(&force_total[i], &temp)
  }
}
void Calc()
{
  int i, j;
  double  distX, distY, distZ,
          distX2, distY2, distZ2,
          total_dist, dist_cubed, GG;
  for (i = 0; i < N; i++)
  {
    //No Race conditions if we have shared instances
    for (j = 0; j < i; j++)
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

      force[i][j].x = GG*distX;
      force[i][j].y = GG*distY;
      force[i][j].z = GG*distZ;

      force[j][i].x = -force[i][j].x;
      force[j][i].y = -force[i][j].y;
      force[j][i].z = -force[i][j].z;
    }
  }
}

void ending()
{
  int i;
  for(i=0;i<DIM;i++)
  {//No Race
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

double mysecond(){
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp,&tzp);
  return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

int main (int argc, char *argv[]) {
  printf("Starting");

  //Var Declarations

  int i,j;
  double t1[TRIALS], t2[TRIALS], t=0;
  /*Initialization*/
  printf("check 2");
  for(i=0;i<N;i++)
  {
    /*
    vec_dat(&pos[i], (rand() / (double)(RAND_MAX)) * 2 - 1, (rand() / (double)(RAND_MAX)) * 2 - 1, (rand() / (double)(RAND_MAX)) * 2 - 1);
    vec_vec(&old_pos[i],&pos[i]);
    vec_dat(&pos[i], (rand() / (double)(RAND_MAX)) * 2 - 1, (rand() / (double)(RAND_MAX)) * 2 - 1, (rand() / (double)(RAND_MAX)) * 2 - 1);
    */
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
    t1[i] = mysecond();
    for(j=0;j<TIME_STEPS;j++){
      memset(force, 0, N*N*sizeof(vector));
      Calc();
      summer();
      ending();
    }
    t2[i] = mysecond();
  }

  //Printin
  for(i=0;i<N;i++){
    printf("Position x = %f\n", posX[i]);
    printf("Position y = %f\n", posY[i]);
    printf("Position z = %f\n", posZ[i]);
		printf("Mass %d = %f\n", i, mass[i]);
	}
  for(i=0;i<TRIALS; i++){
    t+=t2[i]-t1[i];
    printf("%f - %f = %f\n", t2[i], t1[i], t2[i]-t1[i]);
  }
  printf("AVerage %f\n", t/TRIALS);

}
