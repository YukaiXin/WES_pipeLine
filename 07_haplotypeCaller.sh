##

for i in *_recal_reads.bam
do
echo $i

nohup java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-T HaplotypeCaller \
	-R /home/ref/hg19/gatk/ucsc.hg19.fasta \
	-I $i \
	-o ${i%%_*}_raw_variants.vcf &

done 
