# coding:utf-8

import sys,vcf,types

#file = open(r'C:\Users\ykx\PycharmProjects\study\chushai_output_CombineVariants.hg19_multianno.txt', 'r')
file = open(sys.argv[1], 'r')

LSQ_dict1 ={}
YZJ_dict2 ={}
Fushengyi_dict3 ={}

count = 0

for line in file.readlines():
    if count is 0:
        count += 1
        continue

    lineList = line.split("\t")

    if lineList[111].__contains__('1/1') or lineList[111].__contains__('0/1'):
            LSQ_dict1[lineList[6]] = 1
    elif not lineList[6] in LSQ_dict1.keys():
          LSQ_dict1[lineList[6]] = 0

    if lineList[114].__contains__('1/1') or lineList[114].__contains__('0/1'):
            YZJ_dict2[lineList[6]] = 1
    elif not lineList[6] in YZJ_dict2.keys():
            YZJ_dict2[lineList[6]] = 0

    if lineList[116].__contains__('1/1') or lineList[116].__contains__('0/1'):
            Fushengyi_dict3[lineList[6]] = 1
    elif not lineList[6] in Fushengyi_dict3.keys():
            Fushengyi_dict3[lineList[6]] = 0

for id in YZJ_dict2:
    if id in LSQ_dict1.keys() and id in Fushengyi_dict3.keys():
        if LSQ_dict1[id] >= 1 and Fushengyi_dict3[id] >= 1 and YZJ_dict2[id] >= 1:
            print(id)


file.close()
