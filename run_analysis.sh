#!/bin/bash

#SBATCH --job-name="ARGs_OAP"
#SBATCH --time=96:00:00
#SBATCH --cpus-per-task=20
#SBATCH --mem=50G
#SBATCH --array=11-32
#SBATCH --output=/ibiscostorage/dbastoni/read_based_CHL22/logs/slurm-%A_%a.out
#SBATCH --partition=parallel

#
# Copyright 2024 Davide e Deborah
#


sample="$(tail -n +$SLURM_ARRAY_TASK_ID /ibiscostorage/GiovannelliLab/geomosaic/chl22/list_samples.txt | head -n1)"

echo "processing $sample"

# input
r1="/ibiscostorage/GiovannelliLab/geomosaic/chl22/geomosaic/${sample}/fastp/R1.fastq.gz"
r2="/ibiscostorage/GiovannelliLab/geomosaic/chl22/geomosaic/${sample}/fastp/R2.fastq.gz"

folder_read="/ibiscostorage/dbastoni/read_based_CHL22/link_reads/${sample}"
mkdir -p $folder_read

# symbolic link
(cd $folder_read && ln -s ${r1} -T ${sample}_R1.fastq.gz)
(cd $folder_read && ln -s ${r2} -T ${sample}_R2.fastq.gz)

# output
folder_out="/ibiscostorage/dbastoni/read_based_CHL22/output/${sample}/"
mkdir -p $folder_out

# database
gs_database="/ibiscostorage/dbastoni/read_based_CHL22/db/sequences_gs21_all.fasta"
gs_structure="/ibiscostorage/dbastoni/read_based_CHL22/db/structure.txt"

args_oap stage_one -i $folder_read -o $folder_out -f fastq -t 20 --database $gs_database
args_oap stage_two -i $folder_out -t 20 --database $gs_database --structure1 $gs_structure
