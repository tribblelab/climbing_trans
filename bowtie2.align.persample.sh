#!/bin/bash

#SBATCH --job-name=bowtie2.align
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=20GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1
REF=$2

echo "${SAMPLE}"


conda init
conda activate bowtie2

# align (trimmed) sample reads to reference
# alignment summary goes to align_stats.txt
/gscratch/tribblelab/shengkao/tools/conda/envs/bowtie2/bin/bowtie2 \
    -p 10 \
    -q \
    --no-unal \
    -k 10 \
    -x /gscratch/tribblelab/shengkao/climbing_proj/bowtie/${REF}_merged \
    -1 /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_output_forward_paired.fq.gz \
    -2 /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_output_reverse_paired.fq.gz \
    2> /gscratch/tribblelab/shengkao/climbing_proj/bowtie/align_stats/${SAMPLE}_align_stats.txt