#!/bin/bash

#SBATCH --job-name=orthofinder.prep
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=2GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


for dir in /gscratch/tribblelab/shengkao/climbing_proj/spades/*/     # iterate through folders in the spades folder
do
    dirname=${dir%*/}      # remove the trailing "/"
    sample=$(basename $dirname)

   #  echo "$dirname"
   #  echo "$sample"

    echo "check if $dirname/$sample/transcripts.fasta exists"


    # check if transcripts.fasta exists
    # if so, cp and move to orthofinder directory

    if [ -f "$dirname/transcripts.fasta" ]; then
        echo "$sample transripts.fasta exists"

        cp $dirname/transcripts.fasta /gscratch/tribblelab/shengkao/climbing_proj/orthofinder/climbing_data/$sample.fasta
    fi
done