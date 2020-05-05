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
#SBATCH --nodes=1
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# Run the executable named myexe
# and write the output into my_output_file
export OMP_NUM_THREADS=1
srun -n 1 ./a.out > my_output_file
export OMP_NUM_THREADS=2
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=4
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=8
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=12
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=16
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=20
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=24
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=28
srun -n 1 ./a.out >> my_output_file
export OMP_NUM_THREADS=32
srun -n 1 ./a.out >> my_output_file
