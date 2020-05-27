#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>


#define ROWS 10
#define COLUMNS 10
#define CHUNK_ROWS 5
#define CHUNK_COLUMNS 5
#define TAG 0

int** alloca_matrice(int righe, int colonne)
{
    int** matrice=NULL;
    int i;

    matrice = (int **)malloc(righe * sizeof(int*));

    if(matrice != NULL){
        matrice[0] = (int *)malloc(righe*colonne*sizeof(int));
        if(matrice[0]!=NULL)
            for(i=1; i<righe; i++)
                matrice[i] = matrice[0]+i*colonne;
        else{
            free(matrice);
            matrice = NULL;
        }
    }
    else{
        matrice = NULL;
    }
    return matrice;

}

int main(int argc, char* argv[])
{

    int my_id, numprocs,length,i,j;
    int ndims, sizes[2],subsizes[2],starts[2];
    int** DEBUG_CH=NULL;
    int** ddd=NULL;
    int *recvptr=NULL;
    char name[BUFSIZ];
    MPI_Datatype sendsubarray;
    MPI_Datatype recvsubarray;
    MPI_Datatype resizedrecvsubarray;
    //MPI_Status status;
    MPI_Init(&argc, &argv) ;    
    MPI_Comm_rank(MPI_COMM_WORLD, &my_id) ;
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs) ;  // Ottiene quanti processi sono attivi
    if (numprocs != 4) {
        MPI_Abort(MPI_COMM_WORLD,1);
    }
    MPI_Get_processor_name(name, &length);    

    //creo una sottomatrice ripulita dalle ghost cells
    ndims=2;
    sizes[0] = CHUNK_ROWS+2;
    sizes[1] = CHUNK_COLUMNS+2;
    subsizes[0] = CHUNK_ROWS;
    subsizes[1] = CHUNK_COLUMNS;
    starts[0] = 1;
    starts[1] = 1;
    MPI_Type_create_subarray(ndims,sizes,subsizes,starts,MPI_ORDER_C,MPI_INT,&sendsubarray);
    MPI_Type_commit(&sendsubarray);

    DEBUG_CH = alloca_matrice(CHUNK_ROWS+2,CHUNK_COLUMNS+2);
    for(i=0; i<CHUNK_ROWS+2; i++){
        for(j=0; j<CHUNK_COLUMNS+2; j++){
            if(i==0 || i==CHUNK_ROWS+1 || j==0 || j==CHUNK_COLUMNS+1)
                DEBUG_CH[i][j] = 5;
            else
                DEBUG_CH[i][j] = my_id;
        }
    }

    recvptr=DEBUG_CH[0];
    if(my_id==0){
        ddd = alloca_matrice(ROWS,COLUMNS);
        sizes[0]    = ROWS; sizes[1] = COLUMNS;
        subsizes[0] = CHUNK_ROWS; subsizes[1] = CHUNK_COLUMNS;
        starts[0]   = 0; starts[1] = 0;
        MPI_Type_create_subarray(2,sizes,subsizes,starts,MPI_ORDER_C,MPI_INT,&recvsubarray);
        MPI_Type_commit(&recvsubarray);
        MPI_Type_create_resized(recvsubarray, 0, 1*sizeof(int), &resizedrecvsubarray);
        MPI_Type_commit(&resizedrecvsubarray);
        recvptr = ddd[0];
    }

    int counts[5]={1,1,1,1};
    int disps[5] ={0,5,50,55};
    MPI_Gatherv(DEBUG_CH[0],1,sendsubarray,recvptr,counts,disps,resizedrecvsubarray,0,MPI_COMM_WORLD);
    if(!my_id){
        for(i=0; i<ROWS; i++){
            for(j=0; j<COLUMNS; j++){
                printf("%d ",ddd[i][j]);
            }
            printf("\n");
        }
    }

    if(my_id == 0) {
        MPI_Type_free(&resizedrecvsubarray);
        MPI_Type_free(&recvsubarray);
        free(ddd[0]);
        free(ddd);
    } else {
        MPI_Type_free(&sendsubarray);
        free(DEBUG_CH[0]);
        free(DEBUG_CH);
    }

    MPI_Finalize();                             // Chiusura di MPI.
    return 0;
}
