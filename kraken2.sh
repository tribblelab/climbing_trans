#!/bin/bash

#SBATCH --job-name=kraken2
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=200GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x.%j.out 


# sbatch from conda environment

# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1
echo "${SAMPLE}"

conda activate kraken2

# make dir for decontam reads files if it doesn't exist
mkdir -p /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/decontam

# use pluspf database (with fungi reads)
kraken2 --db /gscratch/scrubbed/shengkao/kraken2/pluspf \
    --report /gscratch/tribblelab/shengkao/climbing_proj/kraken2/pluspf/${SAMPLE}.report.txt \
    --threads 24 \
    --paired \
    /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/${SAMPLE}_1.fq.gz \
    /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/${SAMPLE}_2.fq.gz \
    --unclassified-out /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/decontam/${SAMPLE}#.decontam.fq


# extract reads: 
# only the ones which are unclassified/plant taxids

# extract_kraken_reads.py \
#     --kraken /gscratch/tribblelab/shengkao/climbing_proj/kraken2/pluspf/${SAMPLE}.report.txt \
#     -s1 /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/${SAMPLE}_1.fq.gz \
#     -s2 /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/${SAMPLE}_2.fq.gz \
#     -o /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/${SAMPLE}_1.decontam.fq.gz \
#     -o2 /gscratch/tribblelab/climbing_trans_data/${SAMPLE}/${SAMPLE}_2.decontam.fq.gz \
#     --exclude \
#     --taxid 2 4751 9606

echo "Unclassified reads output:"
echo "/gscratch/tribblelab/climbing_trans_data/${SAMPLE}/decontam/${SAMPLE}_1.decontam.fq"
echo "/gscratch/tribblelab/climbing_trans_data/${SAMPLE}/decontam/${SAMPLE}_2.decontam.fq"



