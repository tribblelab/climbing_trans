#!/bin/bash

#SBATCH --job-name=kraken2.download.pluspf
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=200G    
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x.%j.out 

# download the pluspf kraken2 pre-built dataset
# includes fungi sequences

cd /gscratch/scrubbed/shengkao/kraken2

# wget https://genome-idx.s3.amazonaws.com/kraken/k2_pluspf_20260226.tar.gz

tar -xvzf k2_pluspf_20260226.tar.gz -C /gscratch/scrubbed/shengkao/kraken2/pluspf



