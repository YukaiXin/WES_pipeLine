import sys,time

arr = {}
is_f = False
sum = 0

output = open(sys.argv[2] , 'w')   ##exp:LSQ_depth.txt

file_read = open(sys.argv[1], 'rU')

for count,line in enumerate(file_read):
    lineList =  line.split("\t")
   # sum += int(lineList[2])
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

output.write("depth"+"\t"+"count"+"\t"+"qc"+"\t"+"ac"+"\n")
for id in range(0, 501):

    time.sleep(0.1)
    
    p = round(arr[id] / sum, 4)
    a = round((tem_sum-arr[id])/sum, 4)
    print(id, "\t", arr[id], "\t", p, "\t", a)
    st = str(id)+"\t"+str(arr[id])+"\t"+str(p)+"\t"+str(a)+"\n"   
    output.write(st)
    tem_sum = tem_sum -arr[id]
    
file_read.close()
output.close()


