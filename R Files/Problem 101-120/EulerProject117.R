countPossibilities <- function(totalLength, blockLengths){
  possibilities <- rep(0, totalLength)
  blockLengths <- sort(blockLengths)
  for(i in 1:totalLength){
    totalSum <- 0
    for(j in 1:length(blockLengths)){
      if(i - blockLengths[j] > 0){
        totalSum <- totalSum + 1 + sum(possibilities[1:(i - blockLengths[j])])
      } else if(i - blockLengths[j] == 0){
        totalSum <- totalSum + 1
      }
    }
    possibilities[i] <- totalSum 
  }
  return (sum(possibilities))
}

segmentLength <- 50
print(countPossibilities(segmentLength, c(2,3,4))+1)