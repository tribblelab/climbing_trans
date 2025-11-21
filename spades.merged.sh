#!/bin/bash

#SBATCH --job-name=spades.merged
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=100GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# assemble ref transcriptome using merged reads 

# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1



conda init
conda activate spades 


/gscratch/tribblelab/shengkao/tools/conda/envs/spades/bin/python3 /gscratch/tribblelab/shengkao/tools/SPAdes-4.2.0-Linux/bin/spades.py \
    --rna \
    -1 /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_merged_output_forward_paired.fq.gz \
    -2 /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_merged_output_reverse_paired.fq.gz \
    -o /gscratch/tribblelab/shengkao/climbing_proj/spades/${SAMPLE}_merged