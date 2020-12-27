#Read loan data
#stringsAsFacctors=False, False should be capital
loan = read.csv("D:\\prosperLoanData.csv", stringsAsFactors=FALSE, na.strings=c(""))

#Check data
str(loan)
head(x, n) #where x is data and n = the number of data shown from begining 


###See which is state is the borrower
#Use the bar to see the trend or details
gloan = ggplot(loan, aes(BorrowerState))+geom_bar()

#Fill the bar by color(not by other variables)
gloan = ggplot(loan, aes(BorrowerState))+
   geom_bar(col=I("black"), fill=I("#FFCC22"))+
   theme(axis.text.x=element_text(angle=90)) 
#angle means the angle of the text (here it refers to the text on x axis becasue of our setting)
#axis.text.x 為x軸刻度標籤
#There are so many parameter in fn. theme() that can implement our code

###See Income range of the borrower
#Show the distribution of variable IncomeRange by bar chart
gloan = ggplot(loan, aes(loan$IncomeRange))+
  geom_bar(col=I("black"), fill=I("#FFCC22"))

#We wanna rearrange the sequence of data

loan$IncomeRange = ordered(loan$IncomeRange, 
  levels = c("Not displayed", "Not employed", "$0", "$1-24,999", "$25,000-49,999", "$50,000-74,999", "$75,000-99,999", "$100,000+"))

gloan = ggplot(loan, aes(loan$IncomeRange))+
  geom_bar(col=I("black"), fill=I("#FFCC22"))
#Result: Can not seperate the data from income "$1-100,000".
#Need to debug

####See occupation
gloan = ggplot(loan, aes(loan$Occupation))+ #loan$occupation can be turned as "Occupation"
  geom_bar()
#We can see all the texts on x axis are not clear in our code
#We need to made some adjustment

gloan = ggplot(loan, aes(loan$Occupation))+ #loan$occupation can be turned as "Occupation"
  geom_bar(col = I("black"), fill = I("#FFCC22"))+
  theme(axis.text.x = element_text(angle = 90))

#Still vague, so we do the further transforamtion based on theme()
#The perfect result
gloan = ggplot(loan, aes(loan$Occupation))+ #loan$occupation can be turned as "Occupation"
  geom_bar(col = I("black"), fill = I("#FFCC22"))+
  theme(axis.text.x = element_text(angle = 90, vjust=0.5, hjust=1))

#Another trial
#the value of vjust and hjust can be 0 but we do not try this
#1
gloan = ggplot(loan, aes(loan$Occupation))+ #loan$occupation can be turned as "Occupation"
  geom_bar(col = I("black"), fill = I("#FFCC22"))+
  theme(axis.text.x = element_text(angle = 90, vjust=1, hjust=1))

#2
gloan = ggplot(loan, aes(loan$Occupation))+ #loan$occupation can be turned as "Occupation"
  geom_bar(col = I("black"), fill = I("#FFCC22"))+
  theme(axis.text.x = element_text(angle = 90, vjust=1, hjust=0.5))

#3
gloan = ggplot(loan, aes(loan$Occupation))+ #loan$occupation can be turned as "Occupation"
  geom_bar(col = I("black"), fill = I("#FFCC22"))+
  theme(axis.text.x = element_text(angle = 90, vjust=0.5, hjust=0.5))


###Debt to Income ratio
gloan = ggplot(loan, aes(DebtToIncomeRatio))+
  geom_histogram()
#The distribution is not clear at all. We zoom in and focus on the specific inteval of x axis
gloan = ggplot(loan, aes(DebtToIncomeRatio))+
  geom_histogram()+
  xlim(0,1)
#The result we get is much more better but the specific bars in the histogram are still vague

#Use color to make them clear
gloan = ggplot(loan, aes(DebtToIncomeRatio))+
  geom_histogram(col=I("black"), fill=I("#FFCC22"))+
  xlim(0,1)

###Build up the bar chart based on the variables we insterest. We create Bank Card Use as the measurement
#Define "Mild": The value lower than 0.25 quantile in variable of Bank Card Utilization 
loan$BankCardUse[loan$BankCardUtilization<quantile(loan$BankcardUtilization, probs=0.25, "na.rm"=TRUE)] <- "Mild"
#Define "Medium": The 0.25 =< value < 0.5 in quantile in of Bank Card Utilization 
loan$BankCardUse[loan$BankCardUtilization>=quantile(loan$BankcardUtilization, probs=0.25, "na.rm"=TRUE) & 
  (loan$BankCardUtilization<quantile(loan$BankCardUtilization, probs=0.5, na.rm=TRUE))] <- "Medium"
#Define "Heavy": The value >= 0.5 quantile in variable of Bank Card Utilization 
loan$BankCardUse[loan$BankCardUtilization>=quantile(loan$BankcardUtilization, probs=0.5, "na.rm"=TRUE)] <- "Heavy"
#Define "Super": The value >= 1 quantile in variable of Bank Card Utilization 
loan$BankCardUse[loan$BankCardUtilization>=quantile(loan$BankcardUtilization, probs=1, "na.rm"=TRUE)] <- "Super"
#Make the 4 variables in one 
loan$BankCardUse = factor(loan$BankCardUse, levels = c("Mild", "Medium", "Heavy", "Super"))
#Draw he bar chart based on these 4 varaibles we defined
p = ggplot(subset(!is.na(loan$BankCardUse), aes(loan$BankCardUse)))+
  geom_bar(color = I('black'),fill = I('#FFBB66'))

###Result: Something wrong happened in <- "xxx" and hence the result of bar chart can not be shown

###Preprocessing data by transforming chr. into date
loan$LoanOriginationDate = as.Date(loan$LoanOriginationDate)
loan$ListingCreationDate = as.Date(loan$ListingCreationDate)
loan$DateCreditPulled = as.Date(loan$DateCreditPulled)

#Measuring Loan Credit of customer by the median of upper and lower credit loan credit index
loan$CreditScore = (loan$CreditScoreRangeLower + loan$CreditScoreRangeUpper)/2

#Preprocessing
#将两个衡量信用等级的数据转换 >> From "chr" to "ord.factor" that is shown in order where NC < HR < E<...<AA 
loan$CreditGrade = ordered(loan$CreditGrade, levels = c("NC","HR","E","D","C","B","A","AA"))
loan$ProsperRating..Alpha. = ordered(loan$ProsperRating..Alpha., levels = c("HR","E","D","C","B","A","AA"))


#Seperate data into 2 parts based on 2009-07-01
#Create a new variable Phase in loan
loan$Phase[loan$LoanOriginationDate > "2009-07-01"] <- "After 2009-07-01"
loan$Phase[loan$LoanOriginationDate < "2009-07-01"] <- "Before 2009-07-01"
#Check loan$Phase and loan$LoanOriginationDate
head(loan$LoanOriginationDate, n=50)
head(loan$Phase, n=50) #No actual date were shown but only shwon in two types: Before and After 2009-07-01

#对之前未在prosper的客户建立库(数据解释:0或NA是未使用过prosper的客户,反之是使用过的)
#Create a new variable Customer in loan
loan$Customer[loan$TotalProsperLoans > 0] <- "Previous Customer"
loan$Customer[loan$TotalProsperLoans == 0 ] <- "New Customer"
loan = replace_na(loan, replace = list(Customer = "New Customer"))
loan$Customer = factor(loan$Customer)

###客戶信用等級探索
#Create a credit score as variable measuring credit level
loan$CreditScore = (loan$CreditScoreRangeLower + loan$CreditScoreRangeUpper)/2
#Visualize the credit score by bar chart
p = ggplot(loan, aes(loan$CreditScore))+
  geom_bar(col=I("black"), fill = I("#00AA55"))
#Focus on the specific interval to see it clearly
p = ggplot(loan, aes(loan$CreditScore))+
  geom_bar(col=I("black"), fill = I("#00AA55"))+xlim(300,950)
#Add the label on the chart graph
p = ggplot(loan, aes(loan$CreditScore))+
  geom_bar(col=I("black"), fill = I("#00AA55"))+xlim(300,950)
  +ggtitle("Customer Credit Score", "Credit Score") #Title and Subtitle(Suggest to do so so that we can report it in clear way)

#Note: subset(): 從data frame中挑選符合某個條件的數據/列
#挑選loan資料中Loan Origination Date早於2009-07-01的數據，查看資料中這些人的credit score
q = ggplot(data = subset(loan, LoanOriginationDate < "2009-07-01"), aes(CreditGrade))+ 
#We may not use loan$LoanOriginationDate in fn. subset and loan$CreditGrade in aes of ggplot
  geom_bar(col=I("black"), fill = I("orange"))+
  scale_x_discrete(limits = c("NC","HR","E","D","C","B","A","AA")) 
  #Let the bar shown in order from NC to AA (instead of default: AA to NC )
  +ggtitle("Consumer Credit Grade before 2009-07-01")

#挑選loan資料中Loan Origination Date晚於2009-07-01的數據，查看資料中這些人的credit socre
q2 = ggplot(data = subset(loan, LoanOriginationDate > "2009-07-01"), aes(ProsperRating..Alpha.))+
  geom_bar(col = I("black"), fill = I("blue"))+
  scale_x_discrete(limits = c("HR","E","D","C","B","A","AA"))
  +ggtitle("Consumer Credit Grade after 2009-07-01")

#Show three graphs in one graph on device
grid.arrange(p, q, q2)

###Delinquencies
#Use density plot to demonstrate continuous variable
delin = ggplot(loan, aes(loan$DelinquenciesLast7Years))+
  geom_density(col = I("black"), fill = I("yellow"))

#We can focus on the specific interval based on the way of setting quantile
delin = ggplot(loan, aes(loan$DelinquenciesLast7Years))+
  geom_density(col = I("black"), fill = I("yellow"))+
  scale_x_continuous(limits = c(-1, quantile(loan$DelinquenciesLast7Years, probs = 0.25, na.rm = TRUE)))
  #Probs表第x百分位數的值，此函數表示呈現-1到資料中第25%的值的分布

delin = ggplot(loan, aes(loan$DelinquenciesLast7Years))+
  geom_density(col = I("black"), fill = I("yellow"))+
  scale_x_continuous(limits = c(-1, quantile(loan$DelinquenciesLast7Years, probs = 0.5, na.rm = TRUE)))

delin = ggplot(loan, aes(loan$DelinquenciesLast7Years))+
  geom_density(col = I("black"), fill = I("yellow"))+
  scale_x_continuous(limits = c(-1, quantile(loan$DelinquenciesLast7Years, probs = 0.75, na.rm = TRUE)))

delin = ggplot(loan, aes(loan$DelinquenciesLast7Years))+
  geom_density(col = I("black"), fill = I("yellow"))+
  scale_x_continuous(limits = c(-1, quantile(loan$DelinquenciesLast7Years, probs = 0.95, na.rm = TRUE)))

###Show the pattern of Borrower Rate and Term of loan
#Borrower Rate
b = ggplot(loan, aes(BorrowerRate))+
  geom_histogram(col = I("black"), fill = I("blue"))

#Term 
t = ggplot(loan, aes(Term))+
  geom_bar(col = I("black"), fill = I("yellow"))

##0513 ch07 ppt 24


