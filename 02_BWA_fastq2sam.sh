##Align the paired reads to reference genome using bwa mem.

## require a config file 
## exp: 
#    sample3
#    sample2   
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta

while read id
do
sample=`echo $id |awk '{print $1}'`
read1=`echo $id |awk '{print $2}'`
read2=`echo $id |awk '{print $3}'`


#Progress report
echo "Sample : "$sample 

cd ${sample} 
bwa mem -t 10 -R "@RG\tPL:Illumina\tID:foo\tSM:$sample" $reference *1.fq.gz *2.fq.gz > $sample.sam

cd ..
done <$1
