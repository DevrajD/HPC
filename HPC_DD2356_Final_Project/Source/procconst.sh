#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J ProcJob

#SBATCH -t 03:00:00

# Number of nodes
#SBATCH --nodes=256
# Number of MPI processes per node
#SBATCH --ntasks-per-node=64

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell

 

DEBUG=0

for N in 4 6 8 9 12 14 16 32 49 64 90 128 256 512 768 1024 1500 2048 2100 2304 3072 4500 6144 6300 4608 6144 9000 12288 12600 16800 512 1024 1536 2048 3000 4096 4200 33600 768 1536 2304 3072 4500 6144 6300 50400
do
    j=2
    while [ $j -le 16 ]
    do
        if [ $(( $N % $j )) == 0 ]
        then
            PROCESSES=$(( $j * $j ))
            N_BAR=$(( $N / $j ))

            rm myCray_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o Foxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -mcmodel=medium
            srun -n $PROCESSES ./Foxp >> myCray_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}

            rm myCray_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o FoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=0 -D COMMS=1 -mcmodel=medium #This is only to check for communication overheads, hence ignoring DEBUG mode
            srun -n $PROCESSES ./FoxpCOMM >> myCray_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}

            rm myCray_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O3 optimFox.c -o OPFoxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp -mcmodel=medium -D OMP_THREADS=64
            srun -n $PROCESSES ./OPFoxp >> myCray_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}

            rm myCray_OPconstProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O3 optimFox.c -o OPFoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=0 -fopenmp -D COMMS=1 -D OMP_THREADS=64 -mcmodel=medium
            srun -n $PROCESSES ./OPFoxpCOMM >> myCray_OPconstProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
        fi
    done
done

grep Total myCray_* > Cray_results

module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
for N in 4 6 8 9 12 14 16 32 49 64 90 128 256 512 768 1024 1500 2048 2100 2304 3072 4500 6144 6300 4608 6144 9000 12288 12600 16800 512 1024 1536 2048 3000 4096 4200 33600 768 1536 2304 3072 4500 6144 6300 50400
do
    j=2
    while [ $j -le 8 ]
    do
        if [ $(( $N % $j )) == 0 ]
        then
            PROCESSES=$(( $j * $j ))
            N_BAR=$(( $N / $j ))

            rm myIntel_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o Foxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -mcmodel=medium
            srun -n $PROCESSES ./Foxp >> myIntel_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}

            rm myIntel_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o FoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=0 -D COMMS=1 -mcmodel=medium #This is only to check for communication overheads, hence ignoring DEBUG mode
            srun -n $PROCESSES ./FoxpCOMM >> myIntel_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}

            rm myIntel_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O3 optimFox.c -o OPFoxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp -mcmodel=medium -D OMP_THREADS=64
            srun -n $PROCESSES ./OPFoxp >> myIntel_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}

            rm myIntel_OPconstProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O3 optimFox.c -o OPFoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp -D COMMS=1 -D OMP_THREADS=64 -mcmodel=medium
            srun -n $PROCESSES ./OPFoxpCOMM >> myIntel_OPconstProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
        fi
    done
done

grep Total myIntel_* > Intel_results #This will hold all results with the 

# DEBUG=1
# module swap PrgEnv-cray PrgEnv-intel 
# module swap intel intel/19.0.1.144
# for j in 2 3 4 5 6 8 9 10 11 12 14 16
# do
#     PROCESSES=$(( $j * $j ))
#     for i in 2 4 6 8 10 16 20 25 32 64 128
#     do
#         N_BAR=$(( $i ))
#         N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))

#         pkg-config --cflags --libs mkl-dynamic-ilp64-iomp
#         rm my_MKLiompoutput_files${N}_${N_BAR}_PRO${PROCESSES}
#         cc -O3 mklFox.c -o mlkFOXiomp -lm -fopenmp -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG `pkg-config --libs --cflags mkl-dynamic-ilp64-iomp`
#         srun -n $PROCESSES ./mlkFOXiomp >> my_MKLiompoutput_files${N}_${N_BAR}_PRO${PROCESSES}

#         pkg-config --cflags --libs mkl-dynamic-ilp64-seq
#         rm my_MKLseqoutput_files${N}_${N_BAR}_PRO${PROCESSES}
#         cc -O3 mklFox.c -o mlkFOXseq -lm -fopenmp -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG `pkg-config --libs --cflags mkl-dynamic-ilp64-seq`
#         srun -n $PROCESSES ./mlkFOXseq >> my_MKLseqoutput_files${N}_${N_BAR}_PRO${PROCESSES}

#     done
# done
