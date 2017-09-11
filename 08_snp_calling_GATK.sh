##call snps


for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo "Sample " ${i%%_*} "calling snps"


java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-T SelectVariants \
	-R /home/ref/hg19/gatk/ucsc.hg19.fasta \
	-V ${i%%_*}_raw_variants.vcf \
	-selectType SNP \
	-o ${i%%_*}_raw_snps.vcf 

java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-T VariantFiltration \
	-R /home/ref/hg19/gatk/ucsc.hg19.fasta \
	-V ${i%%_*}_raw_snps.vcf \
	--filterExpression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
	--filterName "snp_filter" \
	-o ${i%%_*}_filtered_snps.vcf 
cd ..
done 
