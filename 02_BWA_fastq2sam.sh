##Align the paired reads to reference genome using bwa mem.

## require a config file 
## exp: 
#sampleName   
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta

while read id
do
sample=`echo $id |awk '{print $1}'`
read1=`echo $id |awk '{print $2}'`
read2=`echo $id |awk '{print $3}'`
echo $sample 
echo $read1 
echo $read2  
cd ${sample} 
nohup bwa mem -t 10 -R "@RG\tPL:Illumina\tID:foo\tSM:$sample" $reference *1.fq.gz *2.fq.gz 1> $sample.sam 2>>bwa.log &
cd ..
done <$1
