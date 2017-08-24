##

for id in *_filtered_indels.vcf

do
echo $id, >> tem_config

nohup java -jar  $picard SortVcf    \
    I=$id \
    I=${id%%_*}_filtered_snps.vcf    \
    O=sort_${id%%_*}.vcf
 
grep -v 'chrUn' sort_${id%%_*}.vcf > sort_${id%%_*}_indel_snps.vcf

rm -rf sort_${id%%_*}.* >>sortVcf.log &

done
