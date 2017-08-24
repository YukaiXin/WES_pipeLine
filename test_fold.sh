###
echo "start ########################## `date` "
/home/kxyu/codes/WES_pipeLine/00_trim_Galore.sh

###
echo "######################01 start ##########################"

/home/kxyu/codes/WES_pipeLine/01_FastQC.sh

###
echo "######################02 start ##########################"

/home/kxyu/codes/WES_pipeLine/02_BWA_fastq2sam.sh

###
echo "######################03 start ##########################"
/home/kxyu/codes/WES_pipeLine/03_sam2bam_Sort.sh

###
echo "######################04 start ##########################"
/home/kxyu/codes/WES_pipeLine/04_RM_Duplicates_and_depth_summary.sh

###
echo "######################05 start #########################"
/home/kxyu/codes/WES_pipeLine/05_baseRecalibrator.sh

###
echo "######################06 start ##########################"
/home/kxyu/codes/WES_pipeLine/06_printReads.sh

###
echo "######################07 start ##########################"
/home/kxyu/codes/WES_pipeLine/07_haplotypeCaller.sh

###
echo "######################08 start ##########################"
/home/kxyu/codes/WES_pipeLine/08_snp_calling_GATK.sh

###
echo "######################09 start ##########################"
/home/kxyu/codes/WES_pipeLine/09_indels_calling_GATK.sh

###
echo "######################10 start ##########################"
/home/kxyu/codes/WES_pipeLine/10_sortVcf_snps_indels.sh

### 
echo "######################11 start ##########################"
/home/kxyu/codes/WES_pipeLine/11_six_CombineVariants_and_annotation.sh

###
echo "######################12 start ##########################"
python3 /home/kxyu/codes/WES_pipeLine/12_chushai_from_all_anno_file.py output_CombineVariants.hg19_multianno.txt chushai_output_CombineVariants.hg19_multianno.txt

###
echo "######################13 start ##########################"
python3 /home/kxyu/codes/WES_pipeLine/13_find_xian_for_chushai.py chushai_output_CombineVariants.hg19_multianno.txt > xian_genes.txt
###
echo "######################14 start ##########################"
python3 /home/kxyu/codes/WES_pipeLine/14_find_yin.py output_CombineVariants.hg19_multianno.txt

echo  "Over  #############################" `date` 


