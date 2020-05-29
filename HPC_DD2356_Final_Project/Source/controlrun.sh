#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjobAll

#SBATCH -t 00:5:00

# Number of nodes
#SBATCH --nodes=1
# Number of MPI processes per node
#SBATCH --ntasks-per-node=64

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell
# for i in 9 16 32 64 128 256 512 1024 2048 4096 8192 16384
# do
# rm my_output_fil$i
# rm my_output_fil2De$i
# rm my_output_filDe$i

# cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2
# srun -n $i ./Fox >> my_output_fil$i
# cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2 -D DEBUG=2
# srun -n $i ./Fox >> my_output_fil2De$i
# cc -O2 mainFox.c -o Fox -lm -D N=6 -D N_BAR=2 -D DEBUG=2
# srun -n $i ./Fox >> my_output_filDe$i
# done

DEBUG=1
rm my_output_files*
for i in "6 3" "6 2"
do
    set -- $i
    echo $1 and $2
    N=$(( $1 ))
    N_BAR=$(( $2 ))
    PROCESSES=$(( ($N / $N_BAR) * ( $N / $N_BAR ) ))
    cc -O2 mainFox.c -o Foxs -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
    srun -n $PROCESSES ./Foxs >> my_output_files${N}_$N_BAR
done


# DEBUG=1
# N=4
# N_BAR=2
# MAX_SIDEVAL=64
# for i in 1 2 3
# do
#     while [ $N -le $MAX_SIDEVAL ]
#     do
#         N_BAR=2
#         while [ $N_BAR -le $(( $N / 2 )) ]
#         do
#             PROCESSES=$(( ($N / $N_BAR) * ( $N / $N_BAR ) ))
#             cc -O2 mainFox.c -o Fox -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
#             echo "Size of Compiled File is $(stat -c %s Fox)" >> my_output_file${N}_$N_BAR
#             srun -n $PROCESSES ./Fox >> my_output_file${N}_$N_BAR
#             N_BAR=$(( $N_BAR * 2))
#         done
#         N=$(( $N * 2 ))
#     done
#     N_BAR=$(( $MAX_SIDEVAL / 4 ))
#     N=$MAX_SIDEVAL
#     MAX_SIDEVAL=$(( $MAX_SIDEVAL * 4 ))
# done