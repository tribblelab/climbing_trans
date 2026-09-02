#!/bin/bash

#SBATCH --job-name=orthofinder
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=100GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 

# sbatch from conda environment

# -------------------------------
# set vars
# -------------------------------
DIR=$1 # directory containing necessary fasta files

echo "${DIR}"

conda init
conda activate orthofinder3

/gscratch/tribblelab/shengkao/tools/conda/envs/orthofinder3/bin/orthofinder \
    -d \
    -t 40 \
    -f ${DIR}