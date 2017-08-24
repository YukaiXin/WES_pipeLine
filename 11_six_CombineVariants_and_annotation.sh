awk '{print $1}' sample > tem_sample

awk '{for(i=1;i<=NF;i++)a[NR,i]=$i}END{for(j=1;j<=NF;j++)for(k=1;k<=NR;k++)printf k==NR?a[k,j] RS:a[k,j] FS}' tem_sample > tem_sample_1

while read id
do
sample1=`echo $id |awk '{print $1}'`
sample2=`echo $id |awk '{print $2}'`
sample3=`echo $id |awk '{print $3}'`
sample4=`echo $id |awk '{print $4}'`
sample5=`echo $id |awk '{print $5}'`
sample6=`echo $id |awk '{print $6}'`
echo $sample1
echo $sample2
echo $sample3
echo $sample4
echo $sample5
echo $sample6


java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
-T CombineVariants \
   -R /home/ref/hg19/gatk/ucsc.hg19.fasta \
   --variant:$sample1 $sample1/sort_$sample1_indel_snps.vcf \
   --variant:$sample2 $sample2/sort_$sample2_indel_snps.vcf \
   --variant:$sample3 $sample3/sort_$sample3_indel_snps.vcf \
   --variant:$sample4 $sample4/sort_$sample4_indel_snps.vcf \
   --variant:$sample5 $sample5/sort_$sample5_indel_snps.vcf \
   --variant:$sample6 $sample6/sort_$sample6_indel_snps.vcf \
   -o output_CombineVariants.vcf \
   -genotypeMergeOptions PRIORITIZE \
   -priority $sample1,$sample2,$sample3,$sample4,$sample5,$sample6

/home/database/annovar/table_annovar.pl output_CombineVariants.vcf /home/database/annovar/humandb/ -buildver hg19 -out output_CombineVariants  -remove -protocol refGene,cytoBand,dbnsfp33a,cosmic81,esp6500siv2_all,exac03,1000g2015aug_all,1000g2015aug_eas,snp138,icgc21,clinvar_20170130,genomicSuperDups,gwasCatalog -operation g,r,f,f,f,f,f,f,f,f,f,r,r -nastring . -vcfinput

done < ./tem_sample_1


rm -rf tem*

