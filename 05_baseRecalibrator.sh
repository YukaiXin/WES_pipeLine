for i in *remove_duplicates.bam
do
echo $i
nohup java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
        -nct 10 \
	    -T BaseRecalibrator \
        -R /home/ref/hg19/gatk/ucsc.hg19.fasta \
        -I $i \
        -knownSites /home/database/gatk/dbsnp_138.hg19.vcf \
        -knownSites /home/database/gatk/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf \
        -o ${i%%_*}_recal_data.table &
done
