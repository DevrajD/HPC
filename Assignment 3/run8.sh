#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjob8

# 10 hours wall-clock time will be given to this job
#SBATCH -t 00:10:00

# Number of nodes
#SBATCH --nodes=4
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e8
#SBATCH -o output_file.o8

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
rm my_output_fil8
rm my_output_piBlockParallel8
rm my_output_pi_parallel_nonblocking8
rm my_output_piBinaryTReduc8

cc -O2 Hello.c -o hello8
cc -O2 pi_parallel_blocking.c -o piblockin8
cc -O2 pi_parallel_nonblocking.c -o pinonblockin8
cc -O2 pi_parallel_binaryReduc.c -o pibinaryreduc8


srun -n 8 ./hello8 >> my_output_fil8
srun -n 8 ./piblockin8 >> my_output_piBlockParallel8
srun -n 8 ./pinonblockin8 >> my_output_pi_parallel_nonblocking8
srun -n 8 ./pibinaryreduc8 >> my_output_piBinaryTReduc8
