# Solution: 51161058134250
# Time: < 1 second

digits <- 100
increasing <- matrix(0, digits, 9)
decreasing <- matrix(0, digits, 9)

for(y in 1:9){
  increasing[1, y] <- 1
}
for(x in 2:digits){
  for(y in 1:9){
    sum <- 0
    for(i in y:9){
      sum <- sum + increasing[x - 1, i]
    }
    increasing[x,y] <- sum
  }
}

for(y in 1:9){
  decreasing[1, y] <- 1
}
for(x in 2:digits){
  for(y in 1:9){
    sum <- 1
    for(i in 1:y){
      sum <- sum + decreasing[x - 1, i]
    }
    decreasing[x,y] <- sum
  }
}
sum <- 0
for(i in 1:digits){
  for(j in 1:9){
    sum <- sum + increasing[i,j] + decreasing[i,j]
  }
}
sum <- sum - 9*digits
print(sum)