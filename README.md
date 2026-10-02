# Workflow for Bomarea transcriptome assembly 

[see full documentation](https://docs.google.com/document/d/1Zs_wZpwXcdWQEqOFpey47USY3LiBcJ7eYPk4rK7a9_s/edit?usp=sharing)

## conda

The conda environments are made available as YAML files in the `conda` folder.

```{bash}
conda env create -f <ENVIRONMENT>.yml
```

## Kraken2

Run kraken2 to remove contaminant (human, bacterial, fungal, aka any non-plant) reads.

```{bash}
sbatch kraken2.download.pluspf.sh
sbatch kraken2.sh
```

## Merge & trim reads

## Transcriptome assembly using SPAdes

### QC steps

## Orthofinder


