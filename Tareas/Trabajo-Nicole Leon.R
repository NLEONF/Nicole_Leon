data(rock)
View(rock)
rf <- scale(rock)

library("factoextra")
res <- get_clust_tendency(rf, 40, graph = TRUE)
# Hopskin statistic
res$hopkins_stat

# Visualize the dissimilarity matrix
print(res$plot)

library("cluster")
set.seed(123)
# Compute the gap statistic
gap_stat <- clusGap(rf, FUN = kmeans, nstart = 25, 
                    K.max = 10, B = 500) 
# Plot the result
library(factoextra)
fviz_gap_stat(gap_stat)

# Compute k-means
set.seed(123)
km.res <- kmeans(rf, 2, nstart = 25)
head(km.res$cluster, 20)

# Visualize clusters using factoextra
fviz_cluster(km.res, rock)

# Enhanced hierarchical clustering
res.hc <- eclust(rf, "hclust") # compute hclust


fviz_dend(res.hc, rect = TRUE) # dendrogam

