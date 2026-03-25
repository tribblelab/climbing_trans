#!/bin/bash

#SBATCH --job-name=merge.colombia.samples
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


# merges all of the samples that belong to the same species 
# "manually" for Colombia Bomarea samples

DATA_DIR=/gscratch/tribblelab/climbing_trans_data


# mkdirs for merged files if necessary
mkdir -p /gscratch/tribblelab/climbing_trans_data/merged/B_angustipetala
mkdir -p /gscratch/tribblelab/climbing_trans_data/merged/B_bredemeyerana
mkdir -p /gscratch/tribblelab/climbing_trans_data/merged/B_diffracta


# which files to merge for each species
B_angustipetala="A1 A5 A6 A13 A14 A15 A16"
B_bredemeyerana="A2 A7 A8 A23 A24 A25"
B_diffracta="A9 A11 A12 A21 A22"


# merge the forward files
# ------------------------
forward_files=$(echo $B_angustipetala \
    | sed 's/ /\n/g' \
    | sed 's|^\(.*\)$|/gscratch/tribblelab/climbing_trans_data/\1/\1_1.fq.gz|' \
    | tr '\n' '\t')
cat ${forward_files} > ${DATA_DIR}/merged/B_angustipetala/B_angustipetala_merged_1.fq.gz
echo "${forward_files} in ${DATA_DIR}/merged/B_angustipetala/B_angustipetala_merged_1.fq.gz"

forward_files=$(echo $B_bredemeyerana \
    | sed 's/ /\n/g' \
    | sed 's|^\(.*\)$|/gscratch/tribblelab/climbing_trans_data/\1/\1_1.fq.gz|' \
    | tr '\n' '\t')
cat ${forward_files} > ${DATA_DIR}/merged/B_bredemeyerana/B_bredemeyerana_merged_1.fq.gz
echo "${forward_files} in ${DATA_DIR}/merged/B_bredemeyerana/B_bredemeyerana_merged_1.fq.gz"

forward_files=$(echo $B_diffracta \
    | sed 's/ /\n/g' \
    | sed 's|^\(.*\)$|/gscratch/tribblelab/climbing_trans_data/\1/\1_1.fq.gz|' \
    | tr '\n' '\t')
cat ${forward_files} > ${DATA_DIR}/merged/B_diffracta/B_diffracta_merged_1.fq.gz
echo "${forward_files} in ${DATA_DIR}/merged/B_diffracta/B_diffracta_merged_1.fq.gz"


# merge the reverse files
# ------------------------

reverse_files=$(echo $B_angustipetala \
    | sed 's/ /\n/g' \
    | sed 's|^\(.*\)$|/gscratch/tribblelab/climbing_trans_data/\1/\1_2.fq.gz|' \
    | tr '\n' '\t')
cat ${reverse_files} > ${DATA_DIR}/merged/B_angustipetala/B_angustipetala_merged_2.fq.gz
echo "${reverse_files} in ${DATA_DIR}/merged/B_angustipetala/B_angustipetala_merged_2.fq.gz"

reverse_files=$(echo $B_bredemeyerana \
    | sed 's/ /\n/g' \
    | sed 's|^\(.*\)$|/gscratch/tribblelab/climbing_trans_data/\1/\1_2.fq.gz|' \
    | tr '\n' '\t')
cat ${reverse_files} > ${DATA_DIR}/merged/B_bredemeyerana/B_bredemeyerana_merged_2.fq.gz
echo "${reverse_files} in ${DATA_DIR}/merged/B_bredemeyerana/B_bredemeyerana_merged_2.fq.gz"

reverse_files=$(echo $B_diffracta \
    | sed 's/ /\n/g' \
    | sed 's|^\(.*\)$|/gscratch/tribblelab/climbing_trans_data/\1/\1_2.fq.gz|' \
    | tr '\n' '\t')
cat ${reverse_files} > ${DATA_DIR}/merged/B_diffracta/B_diffracta_merged_2.fq.gz
echo "${reverse_files} in ${DATA_DIR}/merged/B_diffracta/B_diffracta_merged_2.fq.gz"






