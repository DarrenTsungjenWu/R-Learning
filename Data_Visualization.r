###0417課堂筆記
#library(ggplot2)

#課堂案例
#c = ggplot(heightweight, aes(x=ageYear, y=heightln, colour=weightLb))+geom_point()
#print(c)

#善用help函數，了解我們需要的函數有什麼相關功用
#help(ggplot2)

#c = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+geom_point()
#c + geom_jitter(alpha=0.5)
#print(c)

#用data()可以查詢裝配的包裏有哪些現成的數據
#data()
#print(diamonds)

#geom_point(shape=5)，shape的數字不同，點的名字也不一樣
#diamonds = ggplot(diamonds, aes(x=depth, y=price))
#diamonds+geom_point(shape=5)
#print(diamonds)

#將顏色用不同變量來映射
#colour="某個資料裡也有的變數"

#擾動(jitter)，讓疊合一起的點區隔開來
#geom_point(jitter)

#進行標註(label)
#1. 指名具體座標(x=?, y=?)
#2. 指明該座標為何物(label="?")

#coord_fixed()將xy軸等比例呈現，前提是兩者比例不可以差太多

#geom_tile()，透過方塊劃出熱圖

#print(presidential)

library(ggplot2)
g = ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+geom_point
print(g)

