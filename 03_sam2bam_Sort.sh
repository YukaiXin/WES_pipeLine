## sort output .bam
##

##
for i in *1.fastq.gz
do
cd ${i%%_*}

#Progress report
echo " output : " ${i%%_*}_sorted.bam

java -jar $picard SortSam \
      I= *.sam \
      O=${i%%_*}_sorted.bam \
      SORT_ORDER=coordinate \
      CREATE_INDEX=true \
      VALIDATION_STRINGENCY=LENIENT
cd ..
done
