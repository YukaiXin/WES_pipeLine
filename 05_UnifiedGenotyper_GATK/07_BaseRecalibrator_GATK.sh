
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta
bedFile=$1
for i in *1.fastq.gz
do
cd ${i%%_*}


#Progress report
echo "Sample " ${i%%_*} " BaseRecalibrator"

java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
        -nct 10 \
	    -T BaseRecalibrator \
        -R $reference \
        -I  ${i%%_*}_realigned.bam \
        -knownSites /home/database/gatk/dbsnp_138.hg19.vcf \
        -knownSites /home/database/gatk/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf \
        -L $bedFile \
        -o ${i%%_*}_recal_data.table

cd ..
done
