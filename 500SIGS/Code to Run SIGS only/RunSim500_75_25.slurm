#!/bin/bash
#SBATCH --job-name=NRMP_500_17
#SBATCH --nodes=1 #number of nodes requested
#SBATCH --ntasks-per-node=1
#SBATCH --mail-user=rggonzal@caltech.edu #send email to this address if ...
#SBATCH --mail-type=END,FAIL # ... job ends or fails
#SBATCH --time=0-12:30:00 
#SBATCH --qos=long

module purge #make sure the modules environment is sane
module load python3/3.6.4

echo "TRY TO INSTALL PANDAS"
pip3 install numpy pandas --user
 
echo "Running simulation 17 for: 500_5 : "
export PATH=${PATH}:/usr/bin/python3
srun --export=ALL python3 ./Sim500_5_75_25.py
