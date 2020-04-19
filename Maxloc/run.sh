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
#SBATCH --nodes=1
# Number of MPI processes per node
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

#SBATCH -C Haswell

# Run the executable named myexe
# and write the output into my_output_file
module swap PrgEnv-cray PrgEnv-gnu
cc -O2 -fopenmp serialmaxloc.c -lm -o sm.o
cc -O2 -fopenmp partMPfreemaxloc.c -lm -o frm.o
cc -O2 -fopenmp partMPcriticalmaxloc.c -lm -o crm.o
cc -O2 -fopenmp finalmax.c -lm -o fm.o
export OMP_SCHEDULE=static
srun -n 1 ./sm.o > my_output_filstatic
srun -n 1 ./frm.o >> my_output_filstatic
srun -n 1 ./crm.o >> my_output_filstatic
srun -n 1 ./fm.o >> my_output_filstatic
export OMP_SCHEDULE=dynamic
srun -n 1 ./sm.o > my_output_filD
srun -n 1 ./frm.o >> my_output_filD
srun -n 1 ./crm.o >> my_output_filD
srun -n 1 ./fm.o >> my_output_filD
export OMP_SCHEDULE=guided
srun -n 1 ./sm.o > my_output_filG
srun -n 1 ./frm.o >> my_output_filG
srun -n 1 ./crm.o >> my_output_filG
srun -n 1 ./fm.o >> my_output_filG