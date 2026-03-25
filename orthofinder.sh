#!/bin/bash

#SBATCH --job-name=orthofinder
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=10GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# -------------------------------
# set vars
# -------------------------------
DIR=$1 # directory containing necessary fasta files

echo "${DIR}"


conda init
conda activate orthofinder

gscratch/tribblelab/shengkao/tools/conda/envs/orthofinder/bin/orthofinder \
    -f ${DIR}