#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjob16

# 10 hours wall-clock time will be given to this job
#SBATCH -t 00:10:00

# Number of nodes
#SBATCH --nodes=4
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e16
#SBATCH -o output_file.o16

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
rm my_output_fil16
rm my_output_piBlockParallel16
rm my_output_pi_parallel_nonblocking16
rm my_output_piBinaryTReduc16

cc -O2 Hello.c -o hello16
cc -O2 pi_parallel_blocking.c -o piblockin16
cc -O2 pi_parallel_nonblocking.c -o pinonblockin16
cc -O2 pi_parallel_binaryReduc.c -o pibinaryreduc16


srun -n 16 ./hello >> my_output_fil16
srun -n 16 ./piblockin >> my_output_piBlockParallel16
srun -n 16 ./pinonblockin >> my_output_pi_parallel_nonblocking16
srun -n 16 ./pibinaryreduc >> my_output_piBinaryTReduc16
