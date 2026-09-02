#!/bin/bash

#SBATCH --job-name=kraken2.download
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100G    
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# sbatch from conda environment


conda activate kraken2

# wget https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20260226.tar.gz

tar -xvzf k2_standard_20260226.tar.gz -C /gscratch/scrubbed/shengkao/kraken2



