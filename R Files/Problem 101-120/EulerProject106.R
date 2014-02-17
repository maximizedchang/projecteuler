generatePermutations <- function(remaining, set1, set2){
  if(length(set1) == 0.5 * (length(set1) + length(set2) + length(remaining))){
    set2 <- c(set2, remaining)
   # print(paste("set1", set1))
    #print(paste("set2", set2))
    return (analyzeSets(set1, set2))
  } else if(length(set2) == 0.5 * (length(set1) + length(set2) + length(remaining))){
    set1 <- c(set1, remaining)
    return (analyzeSets(set1, set2))
  } else if(length(set2) < 0.5 * (length(set1) + length(set2) + length(remaining)) 
            & length(set1) < 0.5 * (length(set1) + length(set2) + length(remaining))){
    nextNumber <- remaining[1]
    remaining <- remaining[-1] 
    total <- generatePermutations(remaining, c(set1, nextNumber), set2)
    total <- total + generatePermutations(remaining, set1, c(set2, nextNumber))
    return (total)
  }
  return (0)
}

analyzeSets <- function(set1, set2){
  if(length(set1) == 1){
    return (0)
  }
  for(index in 2:length(set1)){
    if(set1[index] > set2[index]){ 
      return (1)
    }
  }
  return (0)
}

overallTotal <- 0
for(i in 1:6){
  overallTotal <- overallTotal + choose(12, 2*i)*generatePermutations((2:(2*i)), c(1), c())
}