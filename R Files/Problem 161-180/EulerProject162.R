generateAllPossibilities <- function(digitsRemaining, has0, has1, hasA){
  if(digitsRemaining == 0+(!has0) + (!has1) + (!hasA)){
    return (factorial(digitsRemaining))
  }
  if(digitsRemaining == 0){
    return (1)
  }
  total <- 0
  if(has0 & has1 & hasA){
    total <- total + 16*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total%%65536
  }
  if(has0 & has1 & !hasA){
    total <- total + 15*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, has1, TRUE)
    total <- total%%65536
  }
  if(has0 & !has1 & hasA){
    total <- total + 15*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, TRUE, hasA)
    total <- total%%65536
  }
  if(!has0 & has1 & hasA){
    total <- total + 15*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, TRUE, has1, hasA)
    total <- total%%65536
  }
  if(has0 & !has1 & !hasA){
    total <- total + 14*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, TRUE, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, has1, TRUE)
    total <- total%%65536
  }
  if(!has0 & has1 & !hasA){
    total <- total + 14*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, TRUE, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, has1, TRUE)
    total <- total%%65536
  }
  if(!has0 & !has1 & hasA){
    total <- total + 14*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, TRUE, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, TRUE, has1, hasA)
    total <- total%%65536
  }
  if(!has0 & !has1 & !hasA){
    total <- total + 13*generateAllPossibilities(digitsRemaining - 1, has0, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, TRUE, has1, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, TRUE, hasA)
    total <- total + generateAllPossibilities(digitsRemaining - 1, has0, has1, TRUE)
    total <- total%%65536
  }
  return (total)
}
final <- 4
for(i in 4:16){
  final <- final + 13*generateAllPossibilities(i - 1, FALSE, FALSE, FALSE)
  final <- final + generateAllPossibilities(i - 1, FALSE, TRUE, FALSE)
  final <- final + generateAllPossibilities(i - 1, FALSE, FALSE, TRUE)
}
print(final)