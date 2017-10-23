#VarScan Call

reference = /home/ref/hg19/gatk/ucsc.hg19.fasta
varScan = /home/biosoftware/varscan/VarScan.v2.3.9.jar

for i in *1.fastq.gz
do
cd ${i%%_*}


#Progress report
echo "Sample " ${i%%_*}" Varscan"


samtools mpileup -f $reference ${i%%_*}_remove_duplicates.bam  >${i%%_*}_remove_duplicates.mpileup

java -jar $varScan  mpileup2snp  ${i%%_*}_remove_duplicates.mpileup   -output-vcf 1 1> ${i%%_*}.varscan.snp.vcf 

java -jar $varScan  mpileup2indel  ${i%%_*}_remove_duplicates.mpileup  -output-vcf 1 1> ${i%%_*}.varscan.indel.vcf 
 
cd ..

done
