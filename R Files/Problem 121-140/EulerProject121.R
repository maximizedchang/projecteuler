numRounds <- 15
numberOfReds <- 1:(numRounds)

countTheWays <- function(numChosen, numLeft, counts){
  if(numChosen == numLeft){
    return (prod(counts[1:numLeft]))
  }
  if(numChosen == 0){
    return (1)
  }
  total <- countTheWays(numChosen - 1, numLeft - 1, counts)*counts[numLeft]
  total <- total + countTheWays(numChosen, numLeft - 1, counts)
  return (total)
}

totalWays <- 0
for(numberOfBluesSelected in ceiling((numRounds + 1)/2):numRounds){
  totalWays <- totalWays + countTheWays(numRounds-numberOfBluesSelected, numRounds, numberOfReds)
}
probVictory <- (totalWays/factorial(numRounds + 1))
print (floor(((1 - probVictory)/probVictory) + 1))