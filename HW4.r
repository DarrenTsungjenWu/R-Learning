###Task 1 statistical test

#We may use t test to test if two samples are statitically different with each other
X = c(20.5, 19.8, 19.7, 20.4, 20.1, 20, 19.0, 19.9)
Y = c(20.7, 19.8, 19.5, 20.8, 20.4, 19.6, 20.2)
t_test = t.test(X, Y, pair = FALSE, conf.level = 0.95)

###Task 2 Correlation
library(igraph)
library(psych)
library(corrplot) # 载入corrplot包

#See structure of data frame
str(iris)
head(iris, n=10) 
#We only need to analyze column 1 to column 4
iris2 = iris[ ,1:4]
correlation = cor(iris2)
corrplot(correlation)

#Test the correlation
corr.test(iris2, alpha = 0.05)

###Task 3 Regression model
data = read.csv("D:\\lm.csv")
str(data)
head(data, n=10) #See the structure of data
y = data$TC
x1 = data$Q
x2 = data$PL
x3 = data$PF
x4 = data$PK
reg = lm(y~x1+x2+x3+x4, data = data)
summary(reg)

#We think x4 caanot explain y properly, so we remove it
y = data$TC
x1 = data$Q
x2 = data$PL
x3 = data$PF
reg2 = lm(y~x1+x2+x3, data = data)
summary(reg2)

#Residual 
res = residuals(reg)
stdr = rstandard(reg) #標準化殘差
fit = predict(reg)

#Choose the best varaible (AIC)
AIC = step(reg)
AIC = step(reg2)


