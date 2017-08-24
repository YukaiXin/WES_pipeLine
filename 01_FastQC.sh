##data quality

i=1
for id in *fq.gz
do 
echo `date` "start do QC for " $id

fastqc -t 20 --noextract -o ./  $id

echo `date` "end do QC for " $id
i=$((i+1))
done 

