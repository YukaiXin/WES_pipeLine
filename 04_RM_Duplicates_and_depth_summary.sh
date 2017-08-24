
echo "start  04_1_rm_duplicates_and_statistics.sh"

/home/kxyu/codes/WES_pipeline/04_1_rm_duplicates_and_statistics.sh

echo "start  04_2_chromosome_depth_summary.py"
for id in *_depth.txt
do
echo $id

python3 /home/kxyu/codes/WES_pipeline/04_2_chromosome_depth_summary.py  ${id%%_*}_depth.txt ${id%%_*}_chr_depth_summary.txt

done

echo "make plot"
path=$(cd `dirname $0`; pwd)
Rscript /home/kxyu/codes/WES_pipeline/04_3_make_depth_summary_plot.R  $path
