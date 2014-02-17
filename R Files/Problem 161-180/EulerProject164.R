# coins of radius 2 replaced with 4 times the number of coins or radius 1

# buildNumbers <- function(digitsRemaining, secondToLastDigit, lastDigit){
#   if(digitsRemaining == 0){
#     return (1)
#   }
#   total <- 0
#   for(i in 0:(9 - (secondToLastDigit + lastDigit))){
#     total <- total + buildNumbers(digitsRemaining - 1, lastDigit, i)
#   }
#   return (total)
# }
# 
# digitCount <- 20
# total <- 0
# for(firstDigit in 1:9){
#   for(secondDigit in 0:9){
#     if(firstDigit + secondDigit <= 9){
#       print(firstDigit*10 + secondDigit)
#       total <- total + buildNumbers(digitCount - 2, firstDigit, secondDigit)
#     }
#   }
# }
# print(total)
threeDigitSets <- c()
for(firstDigit in 1:9){
  for(secondDigit in 0:9){
    for(thirdDigit in 0:9){
      if(firstDigit + secondDigit + thirdDigit <= 9){
        threeDigitSets <- c(threeDigitSets, firstDigit*100 + secondDigit*10 + thirdDigit)
      }
    }
  }
}