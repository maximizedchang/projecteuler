maxTiles <- 1000000
totalConfigurations <- 0
for(innerSideLength in 1:((maxTiles - 4)*0.25)){
  maxOuterSideLength <- floor(sqrt(maxTiles + innerSideLength^2))
  totalConfigurations <- totalConfigurations + floor((maxOuterSideLength - innerSideLength)/2)
}
print (totalConfigurations)
