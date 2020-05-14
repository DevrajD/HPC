#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjob

# 10 hours wall-clock time will be given to this job
#SBATCH -t 00:15:00

# Number of nodes
#SBATCH --nodes=4
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
rm my_output_fil64
rm my_output_piBlockParallel64
rm my_output_pi_parallel_nonblocking64
rm my_output_piBinaryTReduc64

cc -O2 Hello.c -o hello
cc -O2 pi_parallel_blocking.c -o piblockin
cc -O2 pi_parallel_nonblocking.c -o pinonblockin
cc -O2 pi_parallel_binaryReduc.c -o pibinaryreduc


srun -n 64 ./hello >> my_output_fil64
srun -n 64 ./piblockin >> my_output_piBlockParallel64
srun -n 64 ./pinonblockin >> my_output_pi_parallel_nonblocking64
srun -n 64 ./pibinaryreduc >> my_output_piBinaryTReduc64
