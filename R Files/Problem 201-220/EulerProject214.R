source("EulerFunctions.R")
generateNextLevel <- function(factors){
  return (partition(c(), c(), factors))
}

partition <- function(factorsInN, factorsInFractions, unusedFactors){
  if(length(unusedFactors) == 0){
    return (analyzeFactors(factorsInN, factorsInFractions))
  }
  nextFactor <- unusedFactors[1]
  unusedFactors <- unusedFactors[-1]
  result <- partition(c(factorsInN, nextFactor), factorsInFractions, unusedFactors)
  result <- c(result, partition(factorsInN, c(factorsInFractions, nextFactor), unusedFactors))
  return (result)
}

analyzeFactors <- function(factorsInN, factorsInFractions){
  numberN <- 1
  numberFractions <- 1
  for(i in 1:length(factorsInN)){
    if(numberN %% factorsInN[i]){
      numberN <- numberN * factorsInN[i]
    } else {
      numberN <- numberN * factorsInN[i]^2
    }
    splitFactors <- factor(factorsInN[i] - 1)
    
  }
}
currentLevel <- c(2)
for(length in 3:24){
  for(index in 1:length(currentLevel)){
    factors <- factor(currentLevel[index])
    currentLevel <-generateNextLevel(factors)
  }
  
}
#100000
for(i in 39990000:40000000){
  count <- 0
  value <- i
  while(value != 1){
    value <- totient(value)
    count <- count + 1
  }
  print(count)
  if(count == 25){
    print("FFFFFFFFFFFFFFOOOOOOOOUUUUUUUNNNNNNNNNNNNDDDDDD")
    print(i)
    break
  }
}