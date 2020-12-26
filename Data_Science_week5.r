#hehehehe
a = 4
#setwd("D:\\")
data <- read.csv("D:\\input1.csv")
#print(data)
a = class(data$V4)
#print(a)
b <- is.numeric(data$V4)
#print(b)
#date <- as.Date(data$V4)
#print(date)
#date1 <- as.date(data, format, tryFormats=c(2012/1/1, 2012/01/01), optional=FALSE)
#print(date1)

#k <- as.Date(data$sta)

#print(class(data$V4[2]))
k = as.Date(data$V4[2])
#print(class(k))

r <- as.numeric(data$V3[1])
#print(r)
class(data$V3[2])

#data2
data2 <- read.csv("D:\\input2.csv")
#print(data2)
#combind <- rbind(data1, data2)
combind <- rbind(data, data2)
#print(combind)

data1 <- data[,-1]
#print(data1)
names(data1) <- c("id", "name", "salary", "start_date", "dept")
#print(data1)
data1 <- data1[-1,]
#print(data1)

data2 transformation
data2 <- data2[,-1]
#print(data2)
names(data2) <- c("id", "name", "salary", "start_date", "dept")
#print(data2)
data2 <- data2[-1,]
#print(data2)

comment <- list("Rick entered IT at 2012/01/01", "Dan entered Operations at 2013/09/23", "Michelle entered IT at NA", "Ryan entered HR at 2014/05/11")
#print(comment)

#成功的整合
data1$comment = comment
#print(data1)
#print(data1[,1])
#print(data1$id)

#Create a for loop
comment2 <- list()
for(i in 1:length(data1$id))
{
    #There can exist a = 3 only in "for loop"
    comment2[i] = paste(data1$name[i], "entered", data1$dept[i], "at", data1$start_date[i], sep=" ") #paste0
    #等同於comment2[i] = data1$name[i] %>% paste("entered", data1$dept[i], "at", data1$start_date[i], sep=" ")
}    
#print(comment2)

#trial_of_bind <- cbind(data1, comment2)
#print(trial_of_bind)
#failed

#data1$comment = comment2
#print(data1)













