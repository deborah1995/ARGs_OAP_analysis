# ARGs_OAP_analysis

## **Metagenomic Functional Annotation using a Custom Database (GS21-all)**

This repository contains all the necessary files and scripts to run the **ARGs-OAP (Antibiotic Resistance Genes Online Analysis Pipeline)** locally using a custom database, **GS21-all**. This tool enables **functional annotation of metagenomic datasets**.

---

## **Repository Structure**

```
📁 ARGs_OAP_analysis
 ┣ 📄 structure.txt         # A file which contains different levels of information for your sequences
 ┣ 📁 database              # Custom database (GS21-all) for ARGs-OAP
 ┗ 📄 run_analysis.sh      # Script to execute the analysis locally

```
## **File Descriptions**

### 📄 **structure.txt**
A tab-separated file. The first column contains the sequences ID of database.fasta. It should contain at lease one column (level 1).

### 📁 **database**
This folder contains the **GS21-all custom database**.

### 📄 **run_analysis.sh**
This is the main **script** to run the analysis locally. It includes all the commands required to:
1. Run the pipeline using the GS21-all database.
2. Generate output files and reports for downstream analysis.
