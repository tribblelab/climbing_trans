#!/bin/bash

#SBATCH --job-name=tar.ortho
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=5GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x.%j.out 

# -------------------------------
# set vars
# -------------------------------

DIR=$1 # folder of Orthofinder output to tar
# ex: /gscratch/tribblelab/shengkao/climbing_proj/orthofinder/climbing_data_nondecontam/OrthoFinder/Results_Apr17_2

echo "compressing files:"
echo "${DIR}"

NAME=$(basename ${DIR})

echo "compressed file:"
echo "${DIR}/${NAME}.Orthogroup_Sequences.tar.gz"

tar -cvzf \
    ${DIR}/${NAME}.Orthogroup_Sequences.tar.gz \
    --remove-files \
    ${DIR}/Orthogroup_Sequences
