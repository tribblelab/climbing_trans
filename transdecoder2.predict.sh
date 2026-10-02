#!/bin/bash

#SBATCH --job-name=transdecoder2.predict
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --mem=50GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x.%j.out 


# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1

echo "${SAMPLE}"


# sbatch from conda environment
conda init
conda activate transdecoder2


# cd to correct working directory
cd /gscratch/tribblelab/shengkao/climbing_proj/transdecoder2/${SAMPLE}/

/gscratch/tribblelab/shengkao/tools/conda/envs/transdecoder2/bin/TD2.Predict \
    -t /gscratch/tribblelab/shengkao/climbing_proj/spades/${SAMPLE}/transcripts.fasta \
    -O /gscratch/tribblelab/shengkao/climbing_proj/transdecoder2/${SAMPLE}