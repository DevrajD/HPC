DEBUG=0

cd /cfs/klemming/scratch/d/debrajd/HPC/HPC_DD2356_Final_Project/Source
salloc --nodes=1 -t 01:00:00 -A edu20.DD2356 
module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
DEBUG=0
for j in 5 6 7 8
do
    PROCESSES=$(( $j * $j ))
    for i in 2 4 6 8 10 16 20 25 32 64 128 256 512 1024 50 80 100 300 700 1500
    do
        N_BAR=$(( $i ))
        N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))
		echo "Testing Comm"

        rm my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
        cc -O2 mainFox.c -o Foxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
        srun -n $PROCESSES ./Foxp >> my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
    done
done

salloc --nodes=1 -t 01:00:00 -A edu20.DD2356 
module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
DEBUG=0
for j in 6 7 8
do
    PROCESSES=$(( $j * $j ))
    for i in 2 4 6 8 10 16 20 25 32 64 128 256 512 1024 50 80 100 300 700 1500
    do
        N_BAR=$(( $i ))
        N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))
		echo "Testing Comm"
        rm my_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
        cc -O2 mainFox.c -o FoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -D COMMS=1
        srun -n $PROCESSES ./FoxpCOMM >> my_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
    done
done

salloc --nodes=1 -t 01:00:00 -A edu20.DD2356 
module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
DEBUG=0
for j in 6
do
    PROCESSES=$(( $j * $j ))
    for i in 2 4 6 8 10 16 20 25 32 64 128 256 512 1024 50 80 100 300 700 1500
    do
        N_BAR=$(( $i ))
        N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))
		echo "Testing Comm"
        rm my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
        cc -O3 optimFox.c -o OPFoxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp
        srun -n $PROCESSES ./OPFoxp >> my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}


    done
done
