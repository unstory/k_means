library(ggplot2)
# 随机数作为样本进行kmeans聚类
set.seed(1)
x1 = matrix(rnorm(1000, mean=0, sd=0.3), ncol=10)  # 均值为0，标准差为0.3的100*10矩阵
x2 = matrix(rnorm(1000, mean=1, sd=0.3), ncol=10)  # 均值为1，标准差为0.3的100*10矩阵
x = rbind(x1, x2)
cl = kmeans(x, 2)
data = as.data.frame(cbind(x, cl$cluster))
(p = ggplot(data,aes(x=V1,y=V2,color=factor(V11))) + guides(fill="none") + geom_point() + theme_bw())

# 鸢尾花聚类
iris_data = iris[,1:4]
k_means = kmeans(iris_data, centers=3)
iris_data = cbind(iris_data, k_means$cluster, iris[,5])
(g = ggplot(iris_data, aes(Sepal.Length, Sepal.Width, color=factor(k_means$cluster), shape=factor(k_means$cluster)))+geom_point()+theme_bw())
table(iris_data$`k_means$cluster`, iris_data$`iris[, 5]`)
