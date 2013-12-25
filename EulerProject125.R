checkPalindrome <- function(x){
  number <- as.character(x)
  for(i in 1:(floor(nchar(number))/2)){
    if(substr(number, i, i) != substr(number, nchar(number)+1-i, nchar(number)+1-i)){
      return (FALSE)
    }
  }
  return(TRUE)
}

remainingNumbers <- c(1)
palinList <- c()

for(i in 2:10000){
  remainingNumbers <- remainingNumbers + i^2
  for(j in length(remainingNumbers):1){
    if(remainingNumbers[j]>=100000000){
      remainingNumbers <- remainingNumbers[-j]
    } else{
      if(checkPalindrome(remainingNumbers[j])){
        palinList <- c(palinList, remainingNumbers[j])
      }
    }
  }
  remainingNumbers <- c(remainingNumbers, i^2)
}

print(sum(unique(palinList)))