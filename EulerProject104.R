smallStart <- 1
bigStart <- 1
index <- 2
smallEnd <- 1
bigEnd <- 1

analyzeStart <- function(x){
  if(x < 100000000){
    return (FALSE)
  }
  firstNine <- as.numeric(substr(as.character(x), 1, 9)) 
  digits <- as.numeric(strsplit(as.character(firstNine), NULL)[[1]])
  if(0 %in% digits){
    return (FALSE)
  }
  return (length(unique(digits)) == 9)

}

analyzeEnd <- function(x){
  if(x < 100000000){
    return (FALSE)
  }
  lastNine <- x %% 1000000000
  digits <- as.numeric(strsplit(as.character(lastNine), NULL)[[1]])
  if(0 %in% digits){
    return (FALSE)
  }
  return (length(unique(digits)) == 9)
}

while(index < 10000000){
  nextVal <- smallStart + bigStart
  smallStart <- bigStart
  bigStart <- nextVal
  nextVal <- smallEnd + bigEnd
  smallEnd <- bigEnd
  bigEnd <- nextVal
  index <- index + 1
  if(smallStart > 1000000000){
    smallStart <- floor(smallStart / 10)
    bigStart <- floor(bigStart / 10)
  }
  if(smallEnd >= 1000000000){
    smallEnd <- smallEnd %% 1000000000
  }
  if(bigEnd >= 1000000000){
    bigEnd <- bigEnd %% 1000000000
  }
  #if(analyzeEnd(bigEnd)){
  if(analyzeStart(bigStart) & analyzeEnd(bigEnd)){
    print(bigStart)
    print(bigEnd)
    print(index)
   
    break
  }
}