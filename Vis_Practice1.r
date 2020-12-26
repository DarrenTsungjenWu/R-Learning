#list <- list(1:8, 9:17)
#print(list)
#setwd(D:\\)
#c1 <- unlist(list)
#print(list)
#c2 <- list2 <- list(2:9, 6:14)
#unlist(list2)
#ccc <- c1+c2
#print(ccc)

#----------Practice of visulization----------
head(mtcars)
library(ggplot2)

#str(mtcars)

# 1 - Map mpg to x and cyl to y
t1 = ggplot(mtcars, aes(x=mpg, y=cyl))
t1+geom_point()




# 2 - Reverse: Map cyl to x and mpg to y
t1 = ggplot(mtcars, aes(x=cyl, y=mpg))
  t1 + geom_point()

# 3 - Change shape and size of the points in the above plot
t1 = ggplot(mtcars, aes(x=mpg, y=cyl))
  t1+ geom_point(shape = 3, size = 0.02)
#The shape varies according to different code on variable "shape"

#To see the class of the data
class(mtcars) #mtcars is a data frame
class(mtcars$hp) # hp(one of the variables in mtcars is numeric v.)
#Dont forget $ to connect data and its variables when trying understand the specific variable in that data

# 1 - Map cyl to fill
t1 = ggplot(mtcars, aes(x=mpg, y=cyl, fill=hp))
t1+geom_point(shape=4, size=10)

#2  - colouring the data points according to other variables(here, hp)
t1 = ggplot(mtcars, aes(x=mpg, y=cyl, col=hp))
t1+geom_point(shape=2, size=10)
t1 + geom_point(size=10)

# 3 - Change shape and alpha of the points in the above plot
#A really nice alternative is shape = 21 which allows you to use both fill for the inside and col for the outline! 
t1 = ggplot(mtcars, aes(x=mpg, y=cyl, col=hp))
t1+geom_point(shape=21, size=2)
#使shape=21的point之外框的顏色，隨hp值高低而異

t1 = ggplot(mtcars, aes(x=mpg, y=cyl, fill=hp))
t1+geom_point(shape=21, size=2)
#整個shape=21的point，顏色都隨著hp的值變化，而有差異

#map 2 aes to a dot
t1 =ggplot(mtcars, aes(x=mpg, y=cyl, fill=hp))
  t1+geom_point(size=2, alpha=0.5, col="red")
#It will be very tricky when doing this. 
#The later colour(red) will cover the colour based on hp

# 3 - Map am to col in the above plot
t1 = ggplot(mtcars, aes(x=mpg, y=cyl, fill=hp, col=am))
  t1+geom_point(size=2, alpha=0.5)

t1 = ggplot(mtcars, aes(x=mpg, y=cyl, fill=hp))
  t1+geom_point(size=2, alpha=0.5, col="am")
#col=am cant be set in geom_point() as am is not a type of real colour 
#That can only be set in aes() where it can map the colour based on the variables in data


#--------------------------------------
#different mapping requirements
# Map cyl to size
t1 = ggplot(mtcars, aes(x=mpg, y=hp, size=cyl))
  t1+geom_point(alpha=0.5)
#The size of dots vary according to the number of "cyl"

# Map cyl to alpha
t1 = ggplot(mtcars, aes(x=mpg, y=hp, alpha=cyl))
  t1+geom_point()

# Map cyl to shape 
t1 = ggplot(mtcars, aes(x=mpg, y=hp, shape=cyl))
  t1 + geom_point()
##錯誤: A continuous variable can not be mapped to shape

##Anotehr trial to the above (but failed as well)
t1 = ggplot(mtcars, aes(x=mpg, y=hp, shape=vs))
  t1 + geom_point()

# Map cyl to label, label needs to work with geom_text()
#Label the points with the value of "cyl"
t1 = ggplot(mtcars, aes(x=mpg, y=hp, label=cyl))
  t1 + geom_point() + 
  geom_text(size=5) #Adjust the size of the label(labeled by the value of "cyl")
  
  t1 + geom_point() + geom_text()
  #在aes()中使用label功能時，務必要以geom_text()為結尾後綴

#--------------------------------------------------------------------
#The notice from teacher, as below:
#x, y, color, fill, size, alpha, label and shape.
#use these arguments to set attributes of the plot, not aesthetics. 
#these attributes can overwrite the aesthetics of your plot!

# Define a hexadecimal color
# "my.color" cant be the name of the color while "my_color" works 
my_color = "#4ABEFF"

# 1 - First scatter plot, with col aesthetic:
t1 = ggplot(mtcars, aes(x=mpg, y=hp, col = cyl))
t1 + geom_point()

# 2 - Plot 1, but set col attributes in geom layer:
t1 = ggplot(mtcars, aes(x=mpg, y=hp, col = cyl))
t1 + geom_point(col = my_color)

# 3 - Plot 2, with fill instead of col aesthetic, plut shape and size attributes in geom layer.
my_color = "#4ABEFF"
t1 = ggplot(mtcars, aes(x=wt, y=hp, fill = cyl))
t1 + geom_point(shape = 23, size = 8, col=my_color)

#To see how shape=23 looks like
t1 = ggplot(mtcars, aes(x=wt, y=hp))
t1 + geom_point(shape = 23, size = 8)

#Add size and col in aes() simultaneously
t1 = ggplot(mtcars, aes(x=mpg, y=hp, size=vs, col=cyl))
t1 + geom_point(size = 8, alpha=0.5)

# Expand to draw points with alpha 0.5
t1 = ggplot(mtcars, aes(x=mpg, y=hp, fill=cyl))
t1+geom_point(alpha=0.5)

# Expand to draw points with shape 24 and color yellow

#The color of the "point frame" varies according to different value of "cyl"
#只有點的邊框顏色會變，因為沒有填實(fill)
t1 = ggplot(mtcars, aes(x=mpg, y=hp, col=cyl))
t1+geom_point(alpha=0.5, shape=24)

#The color of the "point" varies according to the value of "cyl" (實心)
t1 = ggplot(mtcars, aes(x=mpg, y=hp, col=cyl, fill=cyl))
t1+geom_point(alpha=0.5, shape=24)

t1 = ggplot(mtcars, aes(x=mpg, y=hp, fill=cyl))
t1+geom_point(alpha=0.5, shape=24, col="yellow")
#Assign the color inside the dots as yellow suceeding the step before

# Expand to draw text with label rownames(mtcars) and color red
t1 = ggplot(mtcars, aes(x=mpg, y=hp, fill=cyl))
t1+geom_text(label = rownames(mtcars), color="red")+
geom_point()
#Result: Will show the graph with each dot corresponding the name in orginal data

#Another trial
t1 = ggplot(mtcars, aes(x=mpg, y=hp, fill=cyl))
t1+geom_text(label = rownames(mtcars), color="red")+
geom_point(col="yellow")


#----------Practice2/Iris data-------------
library(ggplot2)
i = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))
i + geom_point()

i = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))
i+geom_point()

#Jitter
i = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))
i + geom_point(position="jitter")

#Identity
i = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))
i + geom_point(position="identity")

ii = position_jitter(width=0.7)
i = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))
i + geom_point(position = ii)

#Set the name of scales
i = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position="jitter")+
  scale_x_continuous("Sepal Length")+ #Name the x axis  
  scale_y_continuous("Sepal Width")+ #Name the y axis
  scale_color_discrete("Species!") #Name the class of color

#Set the limits on axis
i = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position="jitter")+
  scale_x_continuous("Sepal Length", limits = c(6,8))+
  scale_y_continuous("Sepal Width")+
  scale_color_discrete("Speices!")
#Result: It will only show the range of x from 6 to 8, and before this range, nothing will be shown

#Set breaks(Only show the specific value in the range you set, which is "breaks")
i = ggplot(iris, aes(x= Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position= "jitter")+
  scale_x_continuous("Sepal Length", limits = c(6,8), breaks= c(6.2, 6.8, 7.4))+ 
  scale_y_continuous("Sepal Width")+
  scale_color_discrete("Species!")
#You can set breaks on both x and y axis

#Set the breaks in the manner of fn. seq()
i = ggplot(iris, aes(x= Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position= "jitter")+
  scale_x_continuous("Sepal Length", limits = c(6,8), breaks= seq(6,8,0.1))+ #表只秀出從6-8之間的數字，以0.1為間隔
  scale_y_continuous("Sepal Width")+
  scale_color_discrete("Species!")
  
#Notes for seq, breaks and limits
scale_x_continuous("Sepal Length", limits = c(6,8), breaks= seq(1,8,0.1))
#The result will show you the specific value ranging from 6 to 8 with interval 0.1, instead of 1 to 8 
#Because the limits 6 to 8  has been set to limit the focused value

#Change the name inside "Speices" as 1, 2 and 3
#Using fn. label=c("","",""...)
i = ggplot(iris, aes(x= Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position= "jitter")+
  scale_x_continuous("Sepal Length", limits = c(6,8), breaks= seq(6,8,0.1))+ #表只秀出從6-8之間的數字，以0.1為間隔
  scale_y_continuous("Sepal Width")+
  scale_color_discrete("Species!", label=c("1", "2", "3"))

#Expand
#The distance of the border to axis will be shrunk if the value in expand was adjusted
#In this scale, expand = c(0,0) will be the best way to go 
i = ggplot(iris, aes(x= Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position="jitter")+
  scale_x_continuous("Sepal Length", limits=c(3,8), breaks = seq(3,8,0.2), expand= c(0.5,0))+
  scale_y_continuous("Sepal Width", expand= c(0.5,0))+
  scale_color_discrete("Species")

#labs
#To make the label on the graph
i = ggplot(iris, aes(x= Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position="jitter")+
  #Use labs to rename x and y
  labs(x= "Sepal_Length" , y="Sepal_Width", col= "Species_of_Flowers")

i = ggplot(iris, aes(x= Sepal.Length, y=Sepal.Width, col=Species))+
  geom_point(position="jitter")+
#Use labs to name the title, subtitle and caption
  labs(title="Iris", subtitle="The iris", caption="001")
  

#Bar chart
#Use geom_bar() to demonstrate it
#To make the bar of discrete variable
k = ggplot(mtcars, aes(x= cyl))
  k + geom_bar()

#顯示以gear(的值)為分層的bar
k = ggplot(mtcars, aes(x= cyl, fill = factor(gear)))
  k + geom_bar()

#Position=stack(以gear為分層的值會以堆疊呈現)
k = ggplot(mtcars, aes(x= cyl, fill = factor(gear)))
  k + geom_bar(position="stack")

#Position=dodge(以gear為分層的值會分散呈現，即bar-bar相連)
k = ggplot(mtcars, aes(x=cyl, fill= factor(gear)))
  k + geom_bar(position="dodge")

k = ggplot(mtcars, aes(x=cyl,fill = factor(gear)))
  k + geom_bar(position="fill")


#Synthesize
val = c("#FF0000", "#0000FF")
lab = c("a1", "a2")
r = ggplot(mtcars, aes(x=cyl, fill= factor(am)))+
  geom_bar(position="dodge")+
  scale_x_continuous("Cyclinder")+
  scale_y_continuous("Counts")+
  scale_fill_manual("am", value = val, labels = lab)
########Result: Fail to work 錯誤: `breaks` and `labels` must have the same length

t = ggplot(mtcars, aes(x=wt, y=mpg, col= cyl))
  t+geom_point()

t = ggplot(mtcars, aes(x=wt, y=mpg, col= cyl))
  t + geom_point(shape=1, size=4)

t = ggplot(mtcars, aes(x=wt, y=mpg, col= cyl, fill=cyl))
  t + geom_point(shape=1, size=4)
#The point shape=1 can not be filled naybe it is one of its attributes

t = ggplot(mtcars, aes(x=wt, y=mpg, col= cyl, fill=cyl))
  t + geom_point(shape=1, size=4, alpha=0.6)
#Increase the level of transparency to distinguish the overplotting points

####Diamonds Data
#An obviously overplotting data
d = ggplot(diamonds, aes(x= carat, y=price, col=clarity))
  d+geom_point()

d = ggplot(diamonds, aes(x= carat, y=price, col=clarity))
  d+geom_point(alpha=0.5)

d = ggplot(diamonds, aes(x= carat, y=price, col=clarity))
  d+geom_point(alpha=0.1)

#With jitter
d = ggplot(diamonds, aes(x= carat, y=price, col=clarity))
  d+geom_point(alpha=0.5, position="jitter")

d = ggplot(diamonds, aes(x= carat, y=price, col=clarity))
  d+geom_point(alpha=0.5)+
  geom_jitter()


#The transformation of long and wide form data










