#!/bin/bash

#SBATCH --job-name=kraken2.install
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24   # Set to desired number of threads
#SBATCH --mem=100G    
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# sbatch from conda environment


conda activate kraken2

k2 download-taxonomy --db /gscratch/scrubbed/shengkao/kraken2/standarddb

# download the libraries
k2 download-library --library archaea --db /gscratch/scrubbed/shengkao/kraken2/standarddb
k2 download-library --library bacteria --db /gscratch/scrubbed/shengkao/kraken2/standarddb
k2 download-library --library plasmid --db /gscratch/scrubbed/shengkao/kraken2/standarddb
k2 download-library --library viral --db /gscratch/scrubbed/shengkao/kraken2/standarddb
k2 download-library --library human --db /gscratch/scrubbed/shengkao/kraken2/standarddb
k2 download-library --library fungi --db /gscratch/scrubbed/shengkao/kraken2/standarddb


# without --standard flag otherwise it re-downloads the taxonomy info 
# k2 build --standard --threads 24 --db /gscratch/scrubbed/shengkao/kraken2/standarddb
k2 build --threads 24 --db /gscratch/scrubbed/shengkao/kraken2/standarddb



