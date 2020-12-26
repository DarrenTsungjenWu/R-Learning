library(ggplot2)
#There are 2 ways to go, graphics and ggplot

#Scatterplot, example: mtcars
#1 graphics
g = plot(mtcars$wt, mtcars$cyl)

#ggplot
t = ggplot(mtcars, aes(x=wt, y=cyl))
  t+geom_point()

#Bar chart
#Bar chart的Y軸對應的是count(X變數出現的次數，或者說頻率)
#Y想要用不同的，stat要設定為identity，已在aes中使用不同的Y變量
t = ggplot(diamonds, aes(x=color, y=depth))
  t+geom_bar(stat=identity)

t = ggplot(diamonds, aes(x=color))
  t+geom_bar()


#Histogram
t = ggplot(mtcars, aes(x=cyl))
  t+geom_histogram()
  
  #Make each bar red
  t+geom_histogram(fill="red")

#Boxplot
t = ggplot(mtcars, aes(x=am, y=qsec))
  t+geom_boxplot()
#The variable x should be discrete variable. It need to be corrected by the data and variables below

t = ggplot(iris, aes(x=Species, y=Sepal.Length))
  t+geom_boxplot()

#Pie chart
#There is no corresponding fn. that can finish Pie chart directly
#So we have to transform the "Bar chart" into the form of pie
#1 Create a bar chart
t = ggplot(iris, aes(x="", y="", fill=factor(Species)))
  t+geom_bar(width=1, stat="identity")
#In aes(), we rename x and y as other terms we prefer and fill the bar with the discrete variable we insterest

#2 Transform the bar chart into pie chart
t+geom_bar(stat="identity")+coord_polar(theta="y")

#We can also hide the coordinate of the pie chart
k+theme_void()

#Adjust the width and the filled color of each bars
k = ggplot(mtcars, aes(x=cyl, y=disp, fill= factor(gear)))
  k + geom_bar(stat= "identity", width=0.3, position=position_dodge(0.4))

#Show the value(discrete) on the bar
#With label as variable and geom_text() function
k = ggplot(mtcars, aes(x=cyl, y=disp))
  k + geom_bar(stat= "identity", width=0.3, position=position_dodge(0.4))+geom_text(aes(label=disp), vjust=-0.5)

###密度曲線 (geom_density())
#Focus on one specific variables's density
d = ggplot(faithful, aes(x=waiting))  
  d+geom_density()

###density美學
d = ggplot(faithful, aes(x=waiting))  
  d+geom_density(fill="black", alpha=0.5)

d = ggplot(faithful, aes(x=waiting))  
  d+geom_density(fill="black", alpha=0.5)+xlim(30,110) #Focus on specific interval 

###Density + Histogram
dd = ggplot(faithful, aes(x=waiting, y=..density..))
  dd+geom_histogram(fill="cornsilk", col="yellow")+geom_density()+xlim(30,110)

###Showing the correlation matrix
cc = cor(mtcars)

#QQPLOT
#Using data "height"
library(gcookbook)
str(heightweight)
#Draw the qqplot 
qqnorm(heightweight$heightIn)
#Show the line
qqline(heightweight$heightIn)

#Correlation
#Using function cor(x, y), where x and y are both the vectors of the data
#rnorm(n, mean, sd),  where n 是隨機抽樣的次數，mean和sd分別輸入自己設定的數值
#> > rnorm(7, 0, 1) [1] -0.6701554  0.3121219 -0.5964771  0.2636747  3.5105908 -0.3930136 [7] -2.3310598

###熱圖(Heatmap)
h = ggplot(mpg, aes(x=year, y=displ, fill="cyl"))
  h+geom_tile()

h = ggplot(mpg, aes(x=year, y=displ, fill="cty"))
  h+geom_tile()+
  scale_x_continuous(breaks=seq(1995, 2010, 5))+
  scale_y_continuous("DISPL")
  scale_fill_gradient2(midpoint=1.9, mid="grey", limits=c(18, 25))
#Do not work very well maybe it is because of the variable >> Try another new again  
#sacle_y_reverse: 將y軸值顛倒，將其值由最高向上排，到最低

#網絡圖
#Using data "madmen"
library(igraph)
p = graph.data.frame(madmen, directed=TRUE)
p #Just print p
#Plot p 
plot(g, layout=layout.fruchterman.reingold)
#adjust the igraph
plot(g, layout = layout.fruchterman.reingold, vertext= 5 , edge.arrow.size=0.3)

###Maps
#Draw maps with fn. geom_polygon(), or geom_path()
#Notes: The transformation of factor
> str(states)
'data.frame':   15537 obs. of  6 variables:
 $ long     : num  -87.5 -87.5 -87.5 -87.5 -87.6 ...
 $ lat      : num  30.4 30.4 30.4 30.3 30.3 ...
 $ group    : num  1 1 1 1 1 1 1 1 1 1 ...
 $ order    : int  1 2 3 4 5 6 7 8 9 10 ...
 $ region   : chr  "alabama" "alabama" "alabama" "alabama" ...
 $ subregion: chr  NA NA NA NA ...

#Change variable "subregion": from character to factor
states$subregion = as.factor(states$subregion)
str(state)
str(states)
'''
'data.frame':   15537 obs. of  6 variables:
 $ long     : num  -87.5 -87.5 -87.5 -87.5 -87.6 ...
 $ lat      : num  30.4 30.4 30.4 30.3 30.3 ...
 $ group    : num  1 1 1 1 1 1 1 1 1 1 ...
 $ order    : int  1 2 3 4 5 6 7 8 9 10 ...
 $ region   : chr  "alabama" "alabama" "alabama" "alabama" ...
 $ subregion: Factor w/ 16 levels "chesapeake","chincoteague",..: NA NA NA NA NA NA NA NA NA NA ...
'''

###Start to map
states = map_data("state")
m = ggplot(states, aes(x=long, y=lat, group=group))
  m+geom_path()
#fill can not work in geom_path()

states = map_data("state")
m = ggplot(states, aes(x=long, y=lat, group=group))
  m+geom_polygon(fill="white", col="black")

#Projection of map: coord_map()
#Coord_map不能獨立成一個函數
m = ggplot(states, aes(x=long, y=lat, group=group))
  m+geom_path()+coord_map("mercator")

#錯誤示範
m = ggplot(states, aes(x=long, y=lat, group=group))
  m+geom_path()
  m+coord_map("mercator")

###Get access to so many kinds of map around the world
#Global map
s = map_data("world")  
t= ggplot(s, aes(x=long, y=lat, group=group))+
+ geom_polygon(fill="white", col="black")+coord_map("mercator")

#Regional map
#Show all the names of regions
sort(unique(s$region))

a = map_data("world", region="japan")
a = map_data("world", region="Taiwan")
a = map_data("world", region="China")

k= ggplot(a, aes(x=long, y=lat, group=group))+
geom_polygon(fill="white", col="black")+coord_map("mercator")

#等值圖: 地圖+數據合併
#data.frame(..., row.names = NULL, check.rows = FALSE, check.names = TRUE, stringsAsFactors = default.stringsAsFactors())
library(plyr) #等值區域圖
crime = data.frame(state=tolower(row.names(USArrests)), USArrests)
states_map = map_data("state")
crime_map = merge(states_map, crime, by.x = "region", by.y = "state")

#Check how the newly-combined data frame looks like
> str(crime_map)
'''
'data.frame':   15527 obs. of  10 variables:
 $ region   : chr  "alabama" "alabama" "alabama" "alabama" ...
 $ long     : num  -87.5 -87.5 -88 -88 -88 ...
 $ lat      : num  30.4 30.4 30.2 30.2 30.3 ...
 $ group    : num  1 1 1 1 1 1 1 1 1 1 ...
 $ order    : int  1 2 13 14 15 3 4 5 6 7 ...
 $ subregion: chr  NA NA NA NA ...
 '''
 '''
#Below is the data from dataset "crime"
 $ Murder   : num  13.2 13.2 13.2 13.2 13.2 13.2 13.2 13.2 13.2 13.2 ...
 $ Assault  : int  236 236 236 236 236 236 236 236 236 236 ...
 $ UrbanPop : int  58 58 58 58 58 58 58 58 58 58 ...
 $ Rape     : num  21.2 21.2 21.2 21.2 21.2 21.2 21.2 21.2 21.2 21.2 ...
'''

crime_map = arrange(crime_map, group, order) #遞增排序increasing sequence
k = ggplot(crime_map, aes(x=long, y=lat, fill=Assault))+
  geom_polygon(col = "black")+coord_map("mercator")

####Fail to produce a successful map > Need a new trial


