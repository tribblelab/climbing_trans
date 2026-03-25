#!/bin/bash

#SBATCH --job-name=rnaquast.samplewithref
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=10GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=rnaquast.samplewithref.test.out 


# check quality of assembled transcriptome CMT342a (one sample) by using the reference (transcriptome assembled using merged samples)

conda init
conda activate rnaquast

# add busco to path
export PATH="$PATH:/gscratch/tribblelab/shengkao/tools/conda/envs/busco/bin/"

# add genemark s-t to path
export PATH="$PATH:/gscratch/tribblelab/shengkao/tools/GeneMarkST/"

# add rnaquast to path
export PATH="$PATH:/gscratch/tribblelab/shengkao/tools/conda/envs/rnaquast/bin/"

/gscratch/tribblelab/shengkao/tools/conda/envs/rnaquast/bin/python3 /gscratch/tribblelab/shengkao/tools/conda/envs/rnaquast/bin/rnaQUAST.py \
    -1 /gscratch/tribblelab/shengkao/climbing_proj/trimmed/CMT342a_output_forward_paired.fq.gz \
    -2 /gscratch/tribblelab/shengkao/climbing_proj/trimmed/CMT342a_output_reverse_paired.fq.gz \
    --transcripts /gscratch/tribblelab/shengkao/climbing_proj/spades/CMT342a/transcripts.fasta \
    -t 20 \
    --output_dir /gscratch/tribblelab/shengkao/climbing_proj/rnaquast/CMT342a_withref \
    --reference /gscratch/tribblelab/shengkao/climbing_proj/spades/CMT342_merged/transcripts.fasta