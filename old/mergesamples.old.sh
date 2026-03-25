#!/bin/bash

#SBATCH --job-name=merge.samples
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1


# mkdir if necessary
mkdir -p /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}


# get names of files to cat from metadata file
# only forward reads 
forward_files=$(grep ${SAMPLE} /gscratch/tribblelab/climbing_trans_data/MD5.txt |
    grep '.*1\.fq\.gz' |
    awk '{print $2}' | 
    sed 's|[^/]*/||' |
    sed 's|^|/gscratch/tribblelab/climbing_trans_data/|')

cat ${forward_files} > /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_merged_1.fq.gz


echo "${forward_files} in /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_merged_1.fq.gz"

# same as above but only reverse reads
reverse_files=$(grep ${SAMPLE} /gscratch/tribblelab/climbing_trans_data/MD5.txt |
    grep '.*2\.fq\.gz' |
    awk '{print $2}' | 
    sed 's|[^/]*/||' |
    sed 's|^|/gscratch/tribblelab/climbing_trans_data/|')

cat ${reverse_files} > /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_merged_2.fq.gz

echo "${reverse_files} in /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}/${SAMPLE}_merged_2.fq.gz"
