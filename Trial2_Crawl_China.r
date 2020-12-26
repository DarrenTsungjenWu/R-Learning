#Selenium包
library(stringr) # String Processing
library(dplyr)# 调用%>%管道
library(RSelenium) #爬取动态网页
library(xml2)
library(rvest)
library(rjson)

remote = remoteDriver("localhost", 4444L, browser="firefox")
remote$open()

#Access Page Sources
url = "http://data.eastmoney.com/cjsj/gdzctz.html"
remote$navigate(url)

#Create a Null list
data_list = list(NULL)
for (i in 2:6) 
{
    data_list[[i]] = NULL
}

#Create a template
template = "http://data.eastmoney.com/cjsj/townassetsinvest.aspx?p="
counter = 2

#Crawl the data
for(z in 1:7)
{
    #Access Page Sources
    tpage = remote$getPageSource()
    pagesource = tpage[[1]]
    web = read_html(pagesource)

    #Get all rows in the table
    tbrows = web %>% html_nodes("#tb > tbody") %>% html_nodes("tr")

    #Get the elements
    for(i in 2:length(tbrows))
    {
        tds = tbrows[i] %>% html_nodes("td")
        for(j in 1:5)
        {
            data_list[[j]] = c(data_list[[j]], gsub("[ \n]", "", tds[j] %>% html_text()))
            #c()中的data_list[[j]]必須使用[[]]而非[]
        }
    }

    #Crawl Data page by page (repeatedly)
    if (z == 7)
    {
        break
    }

    url2 = paste0(mode, counter)
    remote$navigate(url2)
    counter = counter+1
}

###Bug: Error in data_list[[j]] : 下標超出邊界

print(data_list)




