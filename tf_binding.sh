bash --out exercise1
cd ~/home/ucsd-train16/code/biom262-2016/weeks/week01/data
cat tf.bed | grep "NFKB" | sed -n '1,702'p > tf.nfkb.bed
# YOUR CODE HERE
wc -l tf.nfkb.bed
echo '--- First 10 lines ---'
head tf.nfkb.bed
echo '--- Random 10 lines ---'
awk -v seed=907 'BEGIN{srand(seed);}{print $0}'  tf.nfkb.bed | head
echo '--- Last 10 lines ---'
tail tf.nfkb.bed
print (exercise1)
#End of exercise1

#Start of exercise2
bash --out exercise2
awk '$3 == "transcript" {print $0}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf
# YOUR CODE HERE
wc -l gencode.v19.annotation.chr22.transcript.gtf
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.gtf
echo '--- Random 10 lines ---'
awk -v seed=907 'BEGIN{srand(seed);}{print $0}' gencode.v19.annotation.chr22.transcript.gtf | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.gtf
print (exercise2)
#End of exercise2

#Start of exercise3

bash --out exercise3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf
# YOUR CODE HERE
wc -l gencode.v19.annotation.chr22.transcript.promoter.gtf
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.promoter.gtf
echo '--- Random 10 lines ---'
awk -v seed=907 'BEGIN{srand(seed);}{print rand()" "$0}' gencode.v19.annotation.chr22.transcript.promoter.gtf | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.promoter.gtf
#End of exercise3


