for i in *1.fastq.gz
do
cd ${i%%_*}
echo ${i%%_*}
nohup java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
        -nct 10 \
	    -T BaseRecalibrator \
        -R /home/ref/hg19/gatk/ucsc.hg19.fasta \
        -I *remove_duplicates.bam \
        -knownSites /home/database/gatk/dbsnp_138.hg19.vcf \
        -knownSites /home/database/gatk/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf \
        -o ${i%%_*}_recal_data.table &

cd ..
done
