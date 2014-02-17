max <- 200
m <- rep(0, max)
found <- rep(FALSE, max)
found[1] <- TRUE
foundNumbers <- list()
foundNumbers[[1]] <- matrix(0, 1, 1)
count <- 0
for(i in 2:max){
  minLength <- i + 1
  dependent <- c(1)
  for(x1 in 1:floor(i/2)){
    x2 <- i - x1
    possibilitiesx1 <- foundNumbers[[x1]]
    possibilitiesx2 <- foundNumbers[[x2]]
    for(row1 in 1:nrow(possibilitiesx1)){
      for(row2 in 1:nrow(possibilitiesx2)){
        reliesOn <- unique(c(possibilitiesx1[row1,], possibilitiesx2[row2,], x1, x2))
        if(length(reliesOn) < minLength){
          minLength <- length(reliesOn)
          dependent <- rbind(reliesOn)
        } else if (length(reliesOn) == minLength){
          dependent <- rbind(dependent, reliesOn)
        }
      }
    }
  }
  foundNumbers[[i]] <- dependent
}
print (total)