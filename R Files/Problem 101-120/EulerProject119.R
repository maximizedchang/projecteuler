sumOfDigits <- function(x){
  digitSum <- 0
  while(x > 0){
    digitSum <- digitSum + (x %% 10)
    x <- floor(x / 10 )
  }
  return (digitSum)
}

sequence <- c()
for(i in 2:40000000){
  power <- 1
  while(i^power < 1600000000000001){
    if(i^power >= 10 & i == sumOfDigits(i^power)){
      sequence <- c(sequence, i^power)
    }
    power <- power + 1
  }
}