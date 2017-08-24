import sys

#file = open(r'C:\Users\ykx\PycharmProjects\study\output_CombineVariants.hg19_multianno.txt', 'r')
file = open(sys.argv[1], 'r')
count = 0

LSQ_dict = {}
LST_dict = {}
YZF_dict = {}
YZJ_dict = {}
Fushengrong_dict = {}
Fushengyi_dict = {}

gene_count = 0
for line in file.readlines():

    lineList = line.split('\t')

    if count is 0:
        count += 1
        continue
    if lineList[6].__contains__(';'):
        continue

    if not lineList[6] in LSQ_dict:
        LSQ_dict[lineList[6]] = 0
    if not lineList[6] in LST_dict:
        LST_dict[lineList[6]] = 0
    if not lineList[6] in YZF_dict:
        YZF_dict[lineList[6]] = 0
    if not lineList[6] in YZJ_dict:
        YZJ_dict[lineList[6]] = 0
    if not lineList[6] in Fushengrong_dict:
        Fushengrong_dict[lineList[6]] = 0
    if not lineList[6] in Fushengyi_dict:
        Fushengyi_dict[lineList[6]] = 0

    ##  LSQ   disease
    if lineList[-6].__contains__('0/1'):
        LSQ_dict[lineList[6]] = LSQ_dict[lineList[6]] + 1
    elif lineList[-6].__contains__('1/1'):
        LSQ_dict[lineList[6]] = LSQ_dict[lineList[6]] + 2

    ##   LST  normal
    if  lineList[-5].__contains__('0/1'):
        LST_dict[lineList[6]] = LST_dict[lineList[6]] +1
    elif lineList[-5].__contains__('1/1'):
        LST_dict[lineList[6]] = LST_dict[lineList[6]] + 2

    ##   YZF  normal
    if  lineList[-4].__contains__('0/1'):
        YZF_dict[lineList[6]] = YZF_dict[lineList[6]] +1
    elif lineList[-4].__contains__('1/1'):
        YZF_dict[lineList[6]] = YZF_dict[lineList[6]] + 2

    ##   YZJ  disease
    if  lineList[-3].__contains__('0/1'):
        YZJ_dict[lineList[6]] = YZJ_dict[lineList[6]] +1
    elif lineList[-3].__contains__('1/1'):
        YZJ_dict[lineList[6]] = YZJ_dict[lineList[6]] + 2

    ##   Fushengrong  normal
    if  lineList[-2].__contains__('0/1'):
        Fushengrong_dict[lineList[6]] = Fushengrong_dict[lineList[6]] +1
    elif lineList[-2].__contains__('1/1'):
        Fushengrong_dict[lineList[6]] = Fushengrong_dict[lineList[6]] + 2

    ##   Fushengyi  disease
    if  lineList[-1].__contains__('0/1'):
        Fushengyi_dict[lineList[6]] = Fushengyi_dict[lineList[6]] +1
    elif lineList[-1].__contains__('1/1'):
        Fushengyi_dict[lineList[6]] = Fushengyi_dict[lineList[6]] + 2


    if id in Fushengrong_dict.keys():
        if LST_dict[id] >= 2 and LSQ_dict[id] < 2 \
            and Fushengyi_dict[id] >= 2 and Fushengrong_dict[id] < 2 \
            and YZJ_dict[id] >= 2 and YZF_dict[id] < 2:
            print(count)
            gene_count = gene_count + 1


print ('筛选出 ',gene_count,' 个隐性突变')


file.close()
