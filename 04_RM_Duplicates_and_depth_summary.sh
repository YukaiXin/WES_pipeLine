
for id in *1.fastq.gz
do
cd ${id%%_*}

#Progress report
echo "Sample : " ${id%%_*}    " remove duplicates"


/home/kxyu/codes/WES_pipeLine/04_1_rm_duplicates_and_statistics.sh

#Progress report
echo "Sample : " ${id%%_*} " statistics chromosome depth"

#python3 /home/kxyu/codes/WES_pipeLine/04_2_chromosome_depth_summary.py  ${id%%_*}_depth.txt ${id%%_*}_chr_depth_summary.txt

#Progress report
echo "Sample : " ${id%%_*} " make depth plot"
path= $(cd `dirname $0`; pwd)
#Rscript /home/Codes/WES_pipeLine/04_3_make_depth_summary_plot.R  $path  ${id%%_*}_chr_depth_summary.txt

cd ..

done

