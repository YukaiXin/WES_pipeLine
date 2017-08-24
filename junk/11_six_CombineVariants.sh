awk '{print $1}' sample > tem_sample

awk '{for(i=1;i<=NF;i++)a[NR,i]=$i}END{for(j=1;j<=NF;j++)for(k=1;k<=NR;k++)printf k==NR?a[k,j] RS:a[k,j] FS}' tem_sample > tem_sample_1

while read id
do
1=`echo $id |awk '{print $1}'`
2=`echo $id |awk '{print $2}'`
3=`echo $id |awk '{print $3}'`
4=`echo $id |awk '{print $4}'`
5=`echo $id |awk '{print $5}'`
6=`echo $id |awk '{print $6}'`
echo $1
echo $2
echo $3
echo $4
echo $5
echo $6


java -jar /home/biosoftware/install_pkg/GenomeAnalysisTK.jar \
-T CombineVariants \
   -R /home/ref/hg19/gatk/ucsc.hg19.fasta \
   --variant:$1 sort_$1_indel_snps.vcf \
   --variant:$2 sort_$2_indel_snps.vcf \
   --variant:$3 sort_$3_indel_snps.vcf \
   --variant:$4 sort_$4_indel_snps.vcf \
   --variant:$5 sort_$5_indel_snps.vcf \
   --variant:$6 sort_$6_indel_snps.vcf \
   -o output_CombineVariants.vcf \
   -genotypeMergeOptions PRIORITIZE \
   -priority $1,$2,$3,$4,$5,$6

/home/database/annovar/table_annovar.pl output_CombineVariants.vcf /home/database/annovar/humandb/ -buildver hg19 -out output_CombineVariants  -remove -protocol refGene,cytoBand,dbnsfp33a,cosmic81,esp6500siv2_all,exac03,1000g2015aug_all,1000g2015aug_eas,snp138,icgc21,clinvar_20170130,genomicSuperDups,gwasCatalog -operation g,r,f,f,f,f,f,f,f,f,f,r,r -nastring . -vcfinput

done < ./tem_sample_1


rm -rf tem*

