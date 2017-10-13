# coding:utf-8
import sys

FITER_GENES_CONDITION_LIST = ['intergenic', 'UTR3' , 'UTR5', 'downstream', 'intronic', 'upstream', 'ncRNA_exonic' , 'ncRNA_intronic', 'intronic', 'ncRNA_splicing']
THE_CHROM_LIST = ['chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6','chr7', 'chr8', 'chr9', 'chr10', 'chr11', 'chr12','chr13', 'chr14', 'chr15','chr16', 'chr17', 'chr18', 'chr19', 'chr20', 'chrM', 'chrX', 'chrY']


file_write = open(sys.argv[2], 'w')

count = 0
with open(sys.argv[1], 'r') as file_read:
    for line in file_read.readlines():

    lineList = line.split('\t')
    if count is 0:
       count += 1
       file_write.write(line)
       continue

    if not lineList[112].__eq__('./.') or not lineList[113].__eq__('./.') or not lineList[115].__eq__('./.'):
       continue

    isFiter = False

    if not lineList[0] in THE_CHROM_LIST:
        break


    if lineList[6].__contains__(';'):
        continue

    ##1000g2015aug_all
    if lineList[87] !='.' and not lineList[87].__contains__('i') and not lineList[87].__contains__('a') and not lineList[87].__contains__('o'):
        if float(lineList[87]) > 0.1:
           continue

    ##ExonicFunc.refGene
    if lineList[8].__eq__('synonymous SNV'):
        continue

    ##Func.refGene
    if lineList[5] in FITER_GENES_CONDITION_LIST:
        continue

    ##CLINSIG
    if not lineList[92].__eq__('.'):
        if lineList[92].__contains__('|'):
            clinSigList = lineList[92].split('|')
            i = 0
            for count in range(len(clinSigList)):
                if clinSigList[count].__contains__('Benign') or clinSigList[count].__contains__('benign'):
                    i += 1
            if i == len(clinSigList):
                isFiter = True
        elif lineList[92].__contains__('Benign') or lineList[92].__contains__('benign'):
            continue

    if isFiter is False:
            file_write.write(line)
 
file_write.close()
