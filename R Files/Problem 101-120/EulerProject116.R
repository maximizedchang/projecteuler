countPossibilities <- function(totalLength, blockLength){
  possibilities <- rep(0, totalLength)
  possibilities[blockLength]<-1
  for(i in (blockLength+1):totalLength){
    possibilities[i]<-(sum(possibilities[1:(i-blockLength)])+1)
  }
  return (sum(possibilities))
}

segmentLength <- 50
print(countPossibilities(segmentLength, 2) + countPossibilities(segmentLength, 3) + countPossibilities(segmentLength, 4))