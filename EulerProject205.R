safeIndex <- function(i, j, targetMatrix){
  if(i > 0 & i <= nrow(targetMatrix) & j > 0 & j <= ncol(targetMatrix)){
    return (targetMatrix[i,j])
  } else {
    return (0)
  }
}

Peter <- matrix(0, 36, 9)
Peter[,1] <- c(rep(1, 4), rep(0, 32))
for(j in 2:9){
  for(i in 1:36){
    Peter[i,j] <- safeIndex(i-1, j-1, Peter) + safeIndex(i-2, j-1, Peter)+safeIndex(i-3, j-1, Peter)+safeIndex(i-4, j-1, Peter)
  }
}

Colin <- matrix(0, 36, 6)
Colin[,1] <- c(rep(1, 6), rep(0, 30))
for(j in 2:6){
  for(i in 1:36){
    Colin[i,j] <- safeIndex(i-1, j-1, Colin) + safeIndex(i-2, j-1, Colin)+safeIndex(i-3, j-1, Colin)+safeIndex(i-4, j-1, Colin)+safeIndex(i-5, j-1, Colin)+safeIndex(i-6, j-1, Colin)
  }
}

PeterCounts <- Peter[,9]
ColinCounts <- Colin[,6]
total <- 0
for(i in 2:36){
  total <- total + (sum(ColinCounts[1:(i - 1)]) * PeterCounts[i])
}
answer <- total/(sum(PeterCounts)*sum(ColinCounts))