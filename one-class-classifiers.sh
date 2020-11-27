#!/bin/bash -l
#SBATCH --time=0-1:0:0
#SBATCH -p gpu
#SBATCH --gres=gpu:1
#SBATCH -J one-class-classifiers
#SBATCH --mail-type=start,end,fail
#SBATCH --mail-user=aayush.garg@uni.lu

echo "== Starting run at $(date)"
echo "== Job ID: ${SLURM_JOBID}"
echo "== Node list: ${SLURM_NODELIST}"

module load swenv/default-env/v1.1-20180716-production
module load lang/Tkinter
module load lib/TensorFlow
module load lib/PyYAML
module load lang/Perl
cd $HOME/AG/one-class-classifiers
python one-class-classifiers.py > one-class-classifiers-output.txt
sstat -j ${SLURM_JOBID} -p
echo "== Stopping run at $(date)"
