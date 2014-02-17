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

primeFactors <- c()
for(i in 2:10){
  if((10^9) %% i == 0){
    numberToFactor <- 0
    for(j in 1:i){
      numberToFactor <- numberToFactor * 10 + 1
    }
    primeFactors <- unique(c(primeFactors, unique(factor(numberToFactor))))
    numberToFactor <- 10^i + 1
    primeFactors <- unique(c(primeFactors, unique(factor(numberToFactor))))
  }
}