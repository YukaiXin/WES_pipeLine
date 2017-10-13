##

for id in *1.fastq.gz

do
cd ${id%%_*}

#Progress report
echo "Sample " ${id%%_*} " SortVcf"

java -jar  $picard SortVcf    \
    I=${id%%_*}_filtered_indels.vcf \
    I=${id%%_*}_filtered_snps.vcf    \
    O= sort_${id%%_*}.vcf
 
grep -v 'chr.*_' sort_${id%%_*}.vcf > sort_${id%%_*}_indel_snps.vcf

rm -rf sort_${id%%_*}.* 
cd ..

done
