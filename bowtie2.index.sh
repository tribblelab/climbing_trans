#!/bin/bash

#SBATCH --job-name=bowtie2.index
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=5GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# -------------------------------
# set vars
# -------------------------------
REF=$1

echo "indexing ${REF}"


conda init
conda activate bowtie2


# index the ref transcriptome assembly 
/gscratch/tribblelab/shengkao/tools/conda/envs/bowtie2/bin/bowtie2-build \
    /gscratch/tribblelab/shengkao/climbing_proj/spades/${REF}_merged/transcripts.fasta \
    /gscratch/tribblelab/shengkao/climbing_proj/bowtie/${REF}_merged 
