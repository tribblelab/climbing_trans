#!/bin/bash

#SBATCH --job-name=kraken2.test
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=150GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# sbatch from conda environment


conda activate kraken2

kraken2 --db /gscratch/scrubbed/shengkao/kraken2/k2_standard \
    --report /gscratch/tribblelab/shengkao/climbing_proj/kraken2/B_distichifolia_drop_2.test.report.txt \
    --threads 24 \
    /gscratch/tribblelab/shengkao/climbing_proj/spades/B_distichifolia_drop_2_merged/transcripts.fasta 


# mpa style output:
# kraken2 --db /gscratch/scrubbed/shengkao/kraken2/k2_standard \
#     --report /gscratch/tribblelab/shengkao/climbing_proj/kraken2/B_angustipetala_merged.test.report.txt \
#     --use-mpa-style \
#     --threads 24 \
#     /gscratch/tribblelab/shengkao/climbing_proj/spades/B_angustipetala_merged/transcripts.fasta 

