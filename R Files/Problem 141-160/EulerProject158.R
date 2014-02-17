numberOfCharacters <- 26
max <- 0
maxn <- 1
for(i in 1:numberOfCharacters){
  value <- choose(numberOfCharacters, i)*(2^i - i - 1)
  print(value)
  if(value > max){
    max <- value
    maxn <- i
  }
}
print(max)
print(maxn)