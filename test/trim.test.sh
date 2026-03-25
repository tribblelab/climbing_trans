#!/bin/bash

#SBATCH --job-name=trim.test
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=20GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=trim.test.out 


# sbatch from conda environment

conda init
conda activate trim

/gscratch/tribblelab/shengkao/tools/conda/envs/trim/bin/trimmomatic \
    PE \
    -threads 8 \
    /gscratch/tribblelab/climbing_trans_data/CMT342c/CMT342c_1.fq.gz \
    /gscratch/tribblelab/climbing_trans_data/CMT342c/CMT342c_2.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/CMT342c_output_forward_paired.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/CMT342c_output_forward_unpaired.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/CMT342c_output_reverse_paired.fq.gz \
    /gscratch/tribblelab/shengkao/climbing_proj/trimmed/CMT342c_output_reverse_unpaired.fq.gz \
    ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36