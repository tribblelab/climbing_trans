#!/bin/bash

#SBATCH --job-name=BUSCO
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=10GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=busco.merged.test.out 


# sbatch from conda environment

# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1


conda init
conda activate busco

/gscratch/tribblelab/shengkao/tools/conda/envs/busco/bin/busco \
    -i /gscratch/tribblelab/shengkao/climbing_proj/spades/${SAMPLE}/transcripts.fasta \
    --mode transcriptome \
    --cpu 20 \
    --out_path /gscratch/tribblelab/shengkao/climbing_proj/busco \
    -o ${SAMPLE}