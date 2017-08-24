##

for id in *1.fastq.gz

do
cd ${id%%_*}
echo ${id%%_*}

nohup java -jar  $picard SortVcf    \
    I=*_filtered_indels.vcf \
    I=${id%%_*}_filtered_snps.vcf    \
    O=../sort_${id%%_*}.vcf
 
grep -v 'chrUn' sort_${id%%_*}.vcf > sort_${id%%_*}_indel_snps.vcf

rm -rf sort_${id%%_*}.* >>sortVcf.log &
cd ..

done
