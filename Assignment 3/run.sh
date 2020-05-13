#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A edu20.DD2356

# The name of the script is myjob
#SBATCH -J myjob

# 10 hours wall-clock time will be given to this job
#SBATCH -t 00:05:00

# Number of nodes
#SBATCH --nodes=2
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
cc -O2 hello.c
srun -n 10 ./a.out > my_output_fil

cc -O2 pi.c
srun -n 10 ./a.out > my_output_piBlockParallel

cc -O2 pi_binaryreduc.c
srun -n 10 ./a.out > my_output_piBinaryTReduc
