##
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta

for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo "Sample " ${i%%_*} " RealignerTargetCreator"

#Perform realignment of the target intervals.
java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
-T IndelRealigner \
-R $reference \
-I ${i%%_*}_remove_duplicates.bam \
-targetIntervals ${i%%_*}_realigner.intervals \
-known /home/database/gatk/dbsnp_138.hg19.vcf \
-known /home/database/gatk/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf \
-o ${i%%_*}_realigned.bam

cd ..
done 