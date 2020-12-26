#更換掉第一個出現的b
#sub("b", "benzobrist")

#更換掉所有b
#gsub("b", "benzobrist")

#更換掉開頭的b
#sub("^b", "benzobrist")

#更換掉結尾的b
#sub("b$", "benzobrist")

#print(getwd())

#trial of substring function
#a = c("adkdmcdmcsdic9r9291")
#substr(file, 開始的位置, 結束的位置) -> 取出從開始位置到結束位置中間的所有元素
#print(substr(a,1,3))

#Practice for the course
text = readLines("D:\\offline.final.trace.txt")
#print(text)
#length(text)
#print(substr(text, 1,1)=="#")

#7th row of text
#text[7]
#print(text[7])

#string的分割
#kk = text[7]
#print(kk)
#↑尚未經過字段分隔的第七row數據
#strsplit(kk, "[;=,]")[[1]]
#print(strsplit(kk, "[;=,]")[[1]])
#↑經過字段分隔的第7row數據(用;區隔變數 用,區隔屬性內變數的資料型態)

#去掉[[1]]的嘗試
#strsplit(kk, "[;=,]")
#print(strsplit(kk, "[;=,]")

#處理1row的數據，based on 7th row 
#oneline = text[7]
#print(oneline)
kr = strsplit(oneline, "[;=,]")[[1]]
#print(kr)

#Read the assigned elements(2,4,6,7,8,10)
#kr[c(2,4,6:8,10)]
#print(kr[c(2,4,6:8,10)])


#Make distingush between -(1:10) and without
#kr[(1:10)]
#print(kr[(1:10)])
#kr[-(1:10)]
#print(kr[-(1:10)])
