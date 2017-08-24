import sys,time

chr_Dict = {}
arr = {}
chr_count = {}
is_f = False
sum  = 0

THE_CHROM_LIST = ['chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6','chr7', 'chr8', 'chr9', 'chr10', 'chr11', 'chr12','chr13', 'chr14', 'chr15','chr16', 'chr17', 'chr18', 'chr19', 'chr20', 'chr21', 'chr22', 'chrX', 'chrY']


#output = open(r'C:\Users\ykx\PycharmProjects\study\LSQ_depth.txt', 'w')
#file_read = open(r"C:\Users\ykx\PycharmProjects\study\fushengyi.txt", 'rU')

output = open(sys.argv[2], 'w')##exp : LSQ_chr_depth_summary.txt
file_read = open(sys.argv[1], 'rU')


for count,line in enumerate(file_read):
    lineList =  line.split("\t")

    if not lineList[0] in chr_Dict.keys():
        chr_Dict[ lineList[0]] = int( lineList[2])
        chr_count[ lineList[0]] = 1
    else:
        chr_Dict[ lineList[0]] = chr_Dict[ lineList[0]] + int( lineList[2])
        chr_count[lineList[0]] += 1

    if int(lineList[2]) >= 500:

       if not lineList[2] in arr:
           if is_f is False:
              is_f = True
              arr[500] = 1
           else:
               arr[500] += 1
    else:
       if not int(lineList[2]) in arr:
          arr[int(lineList[2])] = 1
       else:
          arr[int(lineList[2])] += 1

for id in arr.keys():
    sum += arr[id]

tem_sum = sum
output.write("depth"+"\t"+"count"+"\t"+"qc"+"\t"+"ac"+"\t"+"chrome""\t"+"chr_depth_sum"+"\n")

for id in range(0, 500):

    time.sleep(0.01)

    p = round(arr[id] / sum, 4) ##
    a = round((tem_sum-arr[id])/sum, 4)
    print(id,"\t",arr[id],"\t",p,"\t", a)

    if id < len(THE_CHROM_LIST):
        chr_n = int(chr_Dict[THE_CHROM_LIST[id]]/ chr_count[THE_CHROM_LIST[id]])
        st = str(id)+"\t"+str(arr[id])+"\t"+str(p)+"\t"+str(a)+"\t"+THE_CHROM_LIST[id]+"\t"+str(chr_n)+"\n"
    else:
        st = str(id) +"\t"+str(arr[id])+"\t"+str(p)+"\t"+str(a)+"\t"+"NA"+"\t"+"NA"+"\n"

    output.write(st)

    tem_sum = tem_sum - arr[id]


file_read.close()
output.close()


