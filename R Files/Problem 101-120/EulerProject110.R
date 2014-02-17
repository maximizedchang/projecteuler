maxcount <- 0
target <- 0
primeFactors <- c(2, 3, 5, 7, 11, 13, 17, 19)
for(pow in 1:1){
#for(n in 10000:100000){
  n = 2^3*3^2*5
  print(n)
  counts <- 0
  for(j in (n + 1):(2*n)){
    
    if((n*j)%%(j - n) == 0 ){
      counts <- counts + 1
    }
  }
  print(counts)
  if(counts > maxcount){
    maxcount <- counts
    target <- n
  }
  if(counts > 4000000){
    print(n)
    break
  }
}

#443520 
#know answer is smaller than the product of 2^8*3*5*7*11*13*17*19*23*29*31*37*41(43)
singles <- function(k){
  total <- 0
  for(i in 1:k){
    total <- total + 2^i*choose(k, i)
  }
  return (0.5*total + 1)
}

singles2 <- function(k){
  total <- 0
  for(i in 0:(k - 1)){
    total <- total + choose(k - 1, i)*(2*2^i - (0/1)*1*2^i)
  }
  return (0.5*total + 1)
}

doubles <- function(k){
  total <- 0
  for(i in 1:k){
    total <- total + 2^i*choose(k, i)
  }
  for(i in 0:(k-1)){
    total <- total + choose(k - 1, i)*(3*2^i - (1/2)*2*2^i)
  }
  return (0.5*total + 1)
}

triples <- function(k){
  total <- 0
  for(i in 1:k){
    total <- total + 2^i*choose(k, i)
  }
  for(i in 0:(k-1)){
    total <- total + choose(k - 1, i)*(3*2^i - (1/2)*2*2^i)
  }
  for(i in 0:(k-1)){
    total <- total + choose(k - 1, i)*(4*2^i - (2/3)*3*2^i)
  }
  return (0.5*total + 1)  
}

quads <- function(k){
  total <- 0
  for(i in 1:k){
    total <- total + 2^i*choose(k, i)
  }
  for(i in 0:(k-1)){
    total <- total + choose(k - 1, i)*(3*2^i - (1/2)*2*2^i)
  }
  for(i in 0:(k-1)){
    total <- total + choose(k - 1, i)*(4*2^i - (2/3)*3*2^i)
  }
  for(i in 0:(k-1)){
    total <- total + choose(k - 1, i)*(5*2^i - (3/4)*4*2^i)
  }
  return (0.5*total + 1)  
}

nth <- function(n, k){
  total <- 0
  for(i in 1:k){
    total <- total + 2^i*choose(k, i)
  }
  for(i in 0:(k-1)){
    total <- total + (n-1)*choose(k - 1, i)*(2*2^i)
  }
  return (0.5*total + 1)  
}

for(n in 1:100){
  k <- 2
  while(nth(n, k)<4000000){
    k <- k + 1
  }
  print(paste("n: ", n, " k: ", k, sep =""))
}

givePossibilities <- function(listOfPowers){
  total <- generateTotal(listOfPowers, 1)
  return ((total + 1)/2)
}

generateTotal <- function(listOfPowers, thusFar){
  if(length(listOfPowers)==0){
    return (thusFar)
  }
  total <- generateTotal(listOfPowers[-1], thusFar*(listOfPowers[1]))
  total <- total + generateTotal(listOfPowers[-1], thusFar*(listOfPowers[1] + 1))
  return (total)
}
#answer is givePossibilities(c(3,3,2,2,1,1,1,1,1,1,1,1)) which corresponds to 9,350,130,049,860,600