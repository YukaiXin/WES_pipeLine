##


for i in *remove_duplicates.bam
do
echo $i

java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-nct 10 \
	-T PrintReads \
	-R /home/ref/hg19/gatk/ucsc.hg19.fasta \
	-I ${i%%_*}_remove_duplicates.bam \
	-BQSR ${i%%_*}_recal_data.table \
	-o ${i%%_*}_recal_reads.bam 

done
