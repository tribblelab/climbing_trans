#!/bin/bash

#SBATCH --job-name=transdecoder
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


conda init
conda activate transdecoder


mkdir -p /gscratch/tribblelab/shengkao/climbing_proj/transdecoder/${SAMPLE}

/gscratch/tribblelab/shengkao/tools/TransDecoder-TransDecoder-v6.0.0/TransDecoder \
    --transcripts /gscratch/tribblelab/shengkao/climbing_proj/spades/${SAMPLE}/transcripts.fasta \
    --output_dir /gscratch/tribblelab/shengkao/climbing_proj/transdecoder/${SAMPLE}