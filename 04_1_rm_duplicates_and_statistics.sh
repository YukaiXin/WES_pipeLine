## 1. remove duplicates

##  paramter "$1" is deb file path

for i in *_sorted.bam
do

#Progress report	


 java -jar $picard MarkDuplicates \
	I=$i \
	O=${i%%_*}_remove_duplicates.bam \
	M=${i%%_*}_remove_dup_metrics.txt \
	CREATE_INDEX=true\
	REMOVE_SEQUENCING_DUPLICATES=true

## 2. Computes the depth at each position or region

samtools depth -a -b $1 ${i%%_*}_remove_duplicates.bam > ${i%%_*}_depth.txt	


## 3. Summary read information

samtools stats  ${i%%_*}_remove_duplicates.bam  > tem_summary_reads

grep ^SN tem_summary_reads > ${i%%_*}_summary_reads.txt

rm -rf tem_summary_reads 

done 


