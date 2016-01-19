#PBS -q hotel
#PBS biom262homework1
#PBS -l nodes=1:ppn=2
#PBS -l walltime=0:50:00
#PBS -V
#PBS -m abe

#start of exercise1
cd /oasis/tscc/scratch/ucsd-train16/week1hw
cat tf.bed | grep "NFKB" | sed -n '1,702'p > tf.nfkb.bed


#Start of exercise2
bash --out exercise2
awk '$3 == "transcript" {print $0}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf
#End of exercise2

#Start of exercise3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf

#start of exercise4
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf


