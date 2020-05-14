#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjob128

# 10 hours wall-clock time will be given to this job
#SBATCH -t 00:10:00

# Number of nodes
#SBATCH --nodes=4
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e128
#SBATCH -o output_file.o128

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
rm my_output_fil128
rm my_output_piBlockParallel128
rm my_output_pi_parallel_nonblocking128
rm my_output_piBinaryTReduc128

cc -O2 Hello.c -o hello128
cc -O2 pi_parallel_blocking.c -o piblockin128
cc -O2 pi_parallel_nonblocking.c -o pinonblockin128
cc -O2 pi_parallel_binaryReduc.c -o pibinaryreduc128


srun -n 128 ./hello >> my_output_fil128
srun -n 128 ./piblockin >> my_output_piBlockParallel128
srun -n 128 ./pinonblockin >> my_output_pi_parallel_nonblocking128
srun -n 128 ./pibinaryreduc >> my_output_piBinaryTReduc128
