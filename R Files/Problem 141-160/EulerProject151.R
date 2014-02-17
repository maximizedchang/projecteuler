simulateCutting <- function(pieces){
  if(length(pieces) == 1 & pieces[1] == 5){
    return (0)
  }
  sum <- 0
  uniquePieces <- unique(pieces)
  for(i in 1:length(uniquePieces)){
    val <- uniquePieces[i]
    index <- min(which(pieces == val))
    if(val == 2){
       sum <- sum + simulateCutting(c(pieces[-index], 3, 4, 5))*sum(pieces == val)
    }
    if(val == 3){
      sum <- sum + simulateCutting(c(pieces[-index], 4, 5))*sum(pieces == val)
    }
    if(val == 4){
      sum <- sum + simulateCutting(c(pieces[-index], 5))*sum(pieces == val)
    }
    if(val == 5){
      sum <- sum + simulateCutting(pieces[-index])*sum(pieces == val)
    }
  }
  if(length(pieces) == 1){
    return (1 + sum/length(pieces))
  } 
  return (sum /length(pieces))
}

pieces <- c(2, 3, 4, 5)
print (simulateCutting(pieces))