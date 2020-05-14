#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjob32

# 10 hours wall-clock time will be given to this job
#SBATCH -t 00:10:00

# Number of nodes
#SBATCH --nodes=4
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e32
#SBATCH -o output_file.o32

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
rm my_output_fil32
rm my_output_piBlockParallel32
rm my_output_pi_parallel_nonblocking32
rm my_output_piBinaryTReduc32

cc -O2 Hello.c -o hello32
cc -O2 pi_parallel_blocking.c -o piblockin32
cc -O2 pi_parallel_nonblocking.c -o pinonblockin32
cc -O2 pi_parallel_binaryReduc.c -o pibinaryreduc32


srun -n 32 ./hello >> my_output_fil32
srun -n 32 ./piblockin >> my_output_piBlockParallel32
srun -n 32 ./pinonblockin >> my_output_pi_parallel_nonblocking32
srun -n 32 ./pibinaryreduc >> my_output_piBinaryTReduc32
