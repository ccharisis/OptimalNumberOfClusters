library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra)

df <- USArrests
#df <-rnorm(100)
df <- na.omit(df)
df <- scale(df)
head(df)


distance <- get_dist(head(df,10))
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))

#### K Means ###########################################
k2 <- kmeans(df, centers = 4, nstart = 25)
str(k2)
fviz_cluster(k2, data = df)

### Optimal Number of Clusters ##########################################

set.seed(123)

fviz_nbclust(df, kmeans, method = "wss")
gap_stat <- clusGap(df, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
# Print the result
print(gap_stat, method = "firstmax")

fviz_gap_stat(gap_stat)
