f <- function(x){
  return (1 - x  + x^2 - x^3 + x^4 - x^5 + x^6 - x^7 + x^8 - x^9 + x^10)
}

target <- c()

for(i in 1:11){
  target <- c(target, f(i))
}
A <- matrix(0, 10, 10)
for(i in 1:10){
  A[,i] <- seq(1, 10)^(i - 1)
}
answer <- 0
for(i in 1:10){
  coeff <- solve(A[1:i, 1:i], target[1:i])
  answer <- answer + sum(coeff * (i + 1)^(0:(i - 1)))
}

