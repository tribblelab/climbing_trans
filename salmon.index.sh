#!/bin/bash

#SBATCH --job-name=salmon.index
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj/salmon
#SBATCH --output=/gscratch/tribblelab/shengkao/climbing_proj/logs/%x_%j.out 


# -------------------------------
# set vars
# -------------------------------
REF=$1

echo "indexing ${REF}"


conda init
conda activate salmon


# index the ref transcriptome assembly 
/gscratch/tribblelab/shengkao/tools/conda/envs/salmon/bin/salmon index \
    -t /gscratch/tribblelab/shengkao/climbing_proj/spades/${REF}_merged/transcripts.fasta \
    -i ${REF}_index
