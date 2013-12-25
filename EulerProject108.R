maxcount <- 0
target <- 0
primeFactors <- c(2, 3, 5, 7, 11, 13, 17, 19)
for(pow in 1:1){
#for(n in 10000:100000){
  n = 2^2*3*5*7*11*13*17*19*23
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