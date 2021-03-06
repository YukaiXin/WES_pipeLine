## call indels
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta


for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo "Sample " ${i%%_*} " calling indels"
java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-T SelectVariants \
	-R $reference \
	-V ${i%%_*}_raw_variants.vcf \
	-selectType INDEL \
	-o ${i%%_*}_raw_indels.vcf 

java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
	-T VariantFiltration \
	-R $reference \
	-V ${i%%_*}_raw_indels.vcf \
	--filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" \
	--filterName "indel_filter" \
	-o ${i%%_*}_filtered_indels.vcf 
cd ..
done
