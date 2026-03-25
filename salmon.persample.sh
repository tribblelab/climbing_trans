#!/bin/bash

#SBATCH --job-name=salmon.persample
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=100GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj/salmon
#SBATCH --output=/gscratch/tribblelab/shengkao/climbing_proj/logs/%x_%j.out 


# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1
REF=$2

echo "${SAMPLE}"
echo "${REF}"


# get quants per sample

conda init
conda activate salmon 

/gscratch/tribblelab/shengkao/tools/conda/envs/salmon/bin/salmon 
/gscratch/tribblelab/shengkao/tools/conda/envs/salmon/bin/salmon quant \
    --index ${REF}_index \
    -l A \
    -1 /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_merged_1.fq.gz \
    -2 /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_merged_2.fq.gz \
    -p 8 \
    --validateMappings \
    -o quants/${SAMPLE}_quant
