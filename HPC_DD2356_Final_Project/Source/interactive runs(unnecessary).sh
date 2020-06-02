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
 

salloc --nodes=1 -t 01:00:00 -A edu20.DD2356 
module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
DEBUG=0
#CONST N RUNS
for N in 4 6 8 9 10 12 14 16 25 32 49 50 64 90 128 256 512 768 1024 1500 2048 2100
do
    j=9
    while [ $j -le 16 ]
    do
        if [ $(( $N % $j )) == 0 ]
        then
            PROCESSES=$(( $j * $j ))
            N_BAR=$(( $N / $j ))
            #N=$(( $(bc <<< "scale=0; sqrt($PROCESSES)") * $N_BAR ))

            rm my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o Foxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
            srun -n $PROCESSES ./Foxp >> my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}

            rm my_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o FoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=0 -D COMMS=1 #This is only to check for communication overheads, hence ignoring DEBUG mode
            srun -n $PROCESSES ./FoxpCOMM >> my_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}

            rm my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O3 optimFox.c -o OPFoxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp
            srun -n $PROCESSES ./OPFoxp >> my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            
        fi
        j=$(( $j + 1 ))
    done
done

salloc --nodes=8 -t 01:00:00 -A edu20.DD2356 
module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
for N in 4 6 8 9 10 12 14 16 25 32 49 50 64 90 128 256 512 768 1024 1500 2048 2100 16800
do
    j=2
    while [ $j -le 16 ]
    do
        if [ $(( $N % $j )) == 0 ]
        then
            PROCESSES=$(( $j * $j ))
            N_BAR=$(( $N / $j ))

            rm my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o Foxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG
            srun -n $PROCESSES ./Foxp >> my_constProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            echo "Hi_${j}_${N}_${N_BAR}_${PROCESSES}"
            rm my_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O2 mainFox.c -o FoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=0 -D COMMS=1 #This is only to check for communication overheads, hence ignoring DEBUG mode
            srun -n $PROCESSES ./FoxpCOMM >> my_constProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            echo "Hi_${j}_${N}_${N_BAR}_${PROCESSES}"
            rm my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O3 optimFox.c -o OPFoxp -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp
            srun -n $PROCESSES ./OPFoxp >> my_OPconstProcoutput_files${N}_${N_BAR}_PRO${PROCESSES}
            echo "Hi_${j}_${N}_${N_BAR}_${PROCESSES}"
        fi
    j=$(( $j + 1 ))
    done
done

grep Total my_* > Intel_results #This will hold all results with the 


salloc --nodes=8 -t 01:00:00 -A edu20.DD2356 
module swap PrgEnv-cray PrgEnv-intel 
module swap intel intel/19.0.1.144
for N in 4 6 8 9 10 12 14 16 25 32 49 50 64 90 128 256 512 768 1024 1500 2048 2100
do
    j=2
    while [ $j -le 16 ]
    do
        if [ $(( $N % $j )) == 0 ]
        then
            PROCESSES=$(( $j * $j ))
            N_BAR=$(( $N / $j ))

            rm my_OPconstProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            cc -O3 optimFox.c -o OPFoxpCOMM -lm -D N=$N -D N_BAR=$N_BAR -D DEBUG=$DEBUG -fopenmp -D COMMS=1
            srun -n $PROCESSES ./OPFoxpCOMM >> my_OPconstProcoutputCOMM_files${N}_${N_BAR}_PRO${PROCESSES}
            echo "Hi_${j}_${N}_${N_BAR}_${PROCESSES}"
        fi
    j=$(( $j + 1 ))
    done
done

grep Total my_* > Intel_results #Thi
