factor <- function(x){
  factors <- c()
  for(i in 2:max(2,floor(sqrt(x)))){
    while(x %% i == 0){
      factors <- c(factors, i)
      x <- x/i
    }
  }
  if(x != 1){
    factors <- c(factors, x)
  }
  return (factors)
}

countPossibilities <- function(factors, product){
  if(length(factors) == 0 & product == 1){
    return (0)
  }
  if(length(factors) == 0){
    return (1)
  }
  nextFactor <- factors[1]
  factors <- factors[-1]
  total <- 0
  while(product < 100000){
    total <- total + countPossibilities(factors, product)
    product <- product * nextFactor
  }
  return (total)
}

counter <- 0
target <- 0
for(i in 2:100000){
  factors <- factor(i)
  if(length(factors) == length(unique(factors))){
    counter <- counter + countPossibilities(factors, prod(factors))
  }
  if(counter >= 10000){
    target <- i - 1
    break
  }
}

counter <- 1
for(i in 2:target){
  factors <- factor(i)
  if(length(factors) == length(unique(factors))){
    counter <- counter + countPossibilities(factors, prod(factors))
  }
  if(counter > 10000){
    target <- i - 1
  }
}

generatePossibilities <- function(factors, product){
  if(length(factors) == 0 & product == 1){
    return (c())
  }
  if(length(factors) == 0){
    return (c(product))
  }
  nextFactor <- factors[1]
  factors <- factors[-1]
  possibilities <- c()
  while(product < 100000){
    possibilities <- c(possibilities, generatePossibilities(factors, product))
    product <- product * nextFactor
  }
  return (possibilities)
}
factors <- factor(target + 1)
possibleNumbers <- generatePossibilities(factors, prod(factors))
possibleNumbers <- sort(possibleNumbers)
print(possibleNumbers[10000 - counter - 1])