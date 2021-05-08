#!/bin/bash
#SBATCH --job-name=NRMP_500_ALL
#SBATCH --nodes=1 #number of nodes requested
#SBATCH --ntasks-per-node=1
#SBATCH --mail-user=rggonzal@caltech.edu #send email to this address if ...
#SBATCH --mail-type=END,FAIL # ... job ends or fails
#SBATCH --time=6-00:00:00 
#SBATCH --qos=long

module purge #make sure the modules environment is sane
module load python3/3.6.4

echo "TRY TO INSTALL PANDAS"
pip3 install numpy pandas --user

echo "Running all simulations: "
export PATH=${PATH}:/usr/bin/python3

for i in 05 25 50 75 95; do
   for j in 05 25 50 75 95; do
      echo "Submitting script "${i}_${j}
      sbatch RunSim500_${i}_${j}.slurm
      sleep 3
   done
done

