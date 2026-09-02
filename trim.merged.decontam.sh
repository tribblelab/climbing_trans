#!/bin/bash

#SBATCH --job-name=trim.merged.decontam
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=20GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# sbatch from conda environment

# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1

echo "${SAMPLE}"

conda init
conda activate trim

/gscratch/tribblelab/shengkao/tools/conda/envs/trim/bin/trimmomatic \
    PE \
    -threads 8 \
    /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_decontam_merged_1.fq.gz \
    /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_decontam_merged_2.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_merged_output_forward_paired.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_merged_output_forward_unpaired.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_merged_output_reverse_paired.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/${SAMPLE}_merged_output_reverse_unpaired.fq.gz \
    ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36

