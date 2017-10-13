##
reference=/home/ref/hg19/gatk/ucsc.hg19.fasta
gatk = /home/biosoftware/install_pkg/GenomeAnalysisTK.jar



for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo "Sample " ${i%%_*} " UnifiedGenotyper"

java -Xmx4g -jar $gatk \
    -T UnifiedGenotyper \
    -glm BOTH \
    -R $reference  \
    -stand_call_conf 50.0 \
    -I ${i%%_*}_recal_reads.bam  \
    -o ${i%%_*}_raw_variants.vcf
    
cd ..
done
