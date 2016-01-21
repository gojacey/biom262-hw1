#!/bin/csh
#PBS -q hotel
#PBS -N Biom262Hw1_GroupAssignment
#PBS -l nodes=1:ppn=1
#PBS -l walltime=0:10:00
#PBS -V
#PBS -M mbaughn@ucsd.edu,jil655@ucsd.edu
#PBS -m abe
#PBS -A ucsd-train16
cd /oasis/tscc/scratch/ucsd-train16/week1hw

cat tf.bed | grep "NFKB" | sed -n '1,702'p > tf.nfkb.bed
#End of exercise1

#Start of exercise2
awk '$3 == "transcript" {print $0}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf
#End of exercise2

#Start of exercise3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf


#Start of Exercise 4: Use bedtools intersect to overlap TFs with promoters
module load biotools
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
#End of Exercise 4

#Start of Exercise 5: Use bedtools getfasta to extract sequences
module load biotools
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -s -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
#yes the strand matters!
#End of Exercise 5


#Submitter Instruction 6 messages:

#person2 (Michael) adds:
echo "Hello I am a message in standard error" (stderr) >&2 
#explainer from instructions:  ">&2 outputs to "secondary" aka "error" output)"


echo "Hello I am a message in standard out" (stdout)
