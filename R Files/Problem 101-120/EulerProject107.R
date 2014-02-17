weights <- c()
coordinates <- c()
for(i in 1:39){
  for(j in (i+1):40){
    if(network[i,j] != "-"){
      weights <- c(weights, as.numeric(as.character(network[i,j])))
      coordinates <- rbind(coordinates, c(i, j))
    }
  }
}
max <- sum(weights)
ordering <- order(weights)
coordinates <- coordinates[ordering,]
weights <- weights[ordering]
cluster <- 1:40
numberOfClusters <- 40
min <- 0 
while(numberOfClusters > 1){
  nextWeight <- weights[1]
  nextCoord <- coordinates[1,]
  weights <- weights[-1]
  coordinates <- coordinates[-1,]
  cluster1 <- cluster[nextCoord[1]]
  cluster2 <- cluster[nextCoord[2]]
  if(cluster1 != cluster2){
    for(i in 1:40){
      if(cluster[i] == cluster2){
        cluster[i] <- cluster1
      }
    }
    numberOfClusters <- numberOfClusters - 1
    min <- min + nextWeight
  }
}