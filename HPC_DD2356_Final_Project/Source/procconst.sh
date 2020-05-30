#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J ProcJob

#SBATCH -t 00:25:00

# Number of nodes
#SBATCH --nodes=1
# Number of MPI processes per node
#SBATCH --ntasks-per-node=64

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell


PROCESSES=9 #Processes variable must be a perfect square value
DEBUG=1

for j in 2 3 4 5 6
do
    PROCESSES=$(( $j * $j ))
    for i in 2 4 6 8 10 16 20 25 32 64 128
    do
        N_BAR=$(( $i ))
        N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))

        rm my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
        cc -O2 mainFox.c -o Foxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
        srun -n $PROCESSES ./Foxp >> my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}

        rm my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
        cc -O3 optimFox.c -o OPFoxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp
        srun -n $PROCESSES ./OPFoxp >> my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}


    done
done

DEBUG=1
module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
pkg-config --cflags --libs mkl-dynamic-ilp64-iomp

for j in 2 3 4 5 6
do
    PROCESSES=$(( $j * $j ))
    for i in 2 4 6 8 10 16 20 25 32 64 128
    do
        N_BAR=$(( $i ))
        N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))

        rm my_MKLoutput_files${N}_${N_BAR}_PRO${PROCESSES}
        cc -O3 mklFox.c -o mlkFOX -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG `pkg-config --libs --cflags mkl-dynamic-ilp64-iomp`
        srun -n $PROCESSES ./mlkFOX >> my_MKLoutput_files${N}_${N_BAR}_PRO${PROCESSES}

    done
done
