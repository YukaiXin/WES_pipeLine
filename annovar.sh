

for i in *1.fastq.gz
do
cd ${i%%_*}
echo ${i%%_*} " ×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××"

for id in *_filtered_*.vcf
do
echo $id
/home/database/annovar/table_annovar.pl ${id%%.*}.vcf /home/database/annovar/humandb/ -buildver hg19 -out ${id%%.*}  -remove -protocol refGene,cytoBand,dbnsfp33a,cosmic81,esp6500siv2_all,exac03,1000g2015aug_all,1000g2015aug_eas,snp138,icgc21,clinvar_20170130,genomicSuperDups,gwasCatalog -operation g,r,f,f,f,f,f,f,f,f,f,r,r -nastring . -vcfinput

done

cd ..
done

