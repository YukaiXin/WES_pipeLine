##
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta

for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo "Sample " ${i%%_*} " PrintReads"

java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-nct 10 \
	-T PrintReads \
	-R $reference \
	-I *${i%%_*}_remove_duplicates.bam \
	-BQSR ${i%%_*}_recal_data.table \
	-o ${i%%_*}_recal_reads.bam 

cd ..
done
