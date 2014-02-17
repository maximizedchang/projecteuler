isPrime <- function(x){
  if(x == 1){ 
    return (FALSE)
  }
  for(i in 2:floor(sqrt(x))){
    if(x %% i == 0){
      return (FALSE)
    }
  }
  return (TRUE)
}
sequence <- c(1, 2)
i <- 2
while(length(sequence) < 2000){
  if(isPrime(6*i - 1) & isPrime(6*i + 1) & isPrime(12*i + 5)){
    sequence <- c(sequence, 3*i*(i - 1) + 2)
  }
  if(isPrime(6*i + 5) & isPrime(6*i - 1) & isPrime(12*i - 7)){
    sequence <- c(sequence, 3*i*(i - 1) + 1 + 6*i)
  }
  i <- i + 1 
}

print(sequence[2000])