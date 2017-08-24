##Align the paired reads to reference genome using bwa mem.

## require a config file 
## exp: 
#sampleName  test_1_val_1.fq.gz   test_2_val_2.fq.gz
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta

while read id
do
sample=`echo $id |awk '{print $1}'`
read1=`echo $id |awk '{print $2}'`
read2=`echo $id |awk '{print $3}'`
echo $sample 
echo $read1 
echo $read2  

nohup bwa mem -t 20 -R "@RG\tPL:Illumina\tID:foo\tSM:$sample" $reference $read1 $read2 1> $sample.sam 2>>bwa.log &

done <$1
