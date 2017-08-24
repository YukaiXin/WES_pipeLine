## sort output .bam
for i in *sam
do
echo $i
echo ${i%.*}.bam
java -jar $picard SortSam \
      I= $i \
      O=${i%.*}_sorted.bam \
      SORT_ORDER=coordinate \
      CREATE_INDEX=true \
      VALIDATION_STRINGENCY=LENIENT
done
