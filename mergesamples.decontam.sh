#!/bin/bash

#SBATCH --job-name=merge.samples.decontam
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=shengkao@uw.edu

#SBATCH --account=tribblelab
#SBATCH --partition=ckpt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=5GB
#SBATCH --time=100:00:00 

#SBATCH --chdir=/gscratch/tribblelab/shengkao/climbing_proj
#SBATCH --output=logs/%x_%j.out 


# -------------------------------
# set vars
# -------------------------------
SAMPLE=$1


# mkdir if necessary
mkdir -p /gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}
OUTDIR="/gscratch/tribblelab/climbing_trans_data/merged/${SAMPLE}"

if [ "$#" -lt 3 ]; then
  echo "Usage:"
  echo "  sbatch mergesamples.sh output_prefix sample1 [sample2 ...]"
  echo
  echo "Expected files (per sample):"
  echo "  sample_R1.fastq(.gz)  sample_R2.fastq(.gz)"
  exit 1
fi

out_prefix="$1"
shift

out_r1="${OUTDIR}/${out_prefix}_decontam_merged_1.fq.gz"
out_r2="${OUTDIR}/${out_prefix}_decontam_merged_2.fq.gz"

echo "Output R1: $out_r1"
echo "Output R2: $out_r2"
echo "Samples:"
printf '  %s\n' "$@"

concat_reads () {
  local read="$1"    # R1 or R2
  shift

  for sample in "$@"; do
    for ext in fastq.gz fq.gz fastq fq; do
      file="/gscratch/tribblelab/climbing_trans_data/${sample}/decontam/${sample}_${read}.decontam.${ext}"
      if [[ -f "$file" ]]; then
        case "$file" in
          *.gz) gzip -cd "$file" ;;
          *)    cat "$file" ;;
        esac
        break
      fi
    done || {
      echo "ERROR: Missing ${read} file for sample '${sample}'" >&2
      exit 1
    }
  done
}

# Concatenate R1
concat_reads 1 "$@" | gzip > "$out_r1"

# Concatenate R2
concat_reads 2 "$@" | gzip > "$out_r2"