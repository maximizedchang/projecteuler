daysInPeriod <- 30
scenarios <- matrix(0, daysInPeriod, 6)
colnames(scenarios) <- c("0NL", "1NL", "2NL", "0L", "1L", "2L") #13
scenarios[1,] <- c(1, 1, 0, 1, 0, 0)
for(i in 2:30){
  scenarios[i, 1] <- scenarios[i - 1, 1] + scenarios[i - 1, 2] + scenarios[i - 1, 3]
  scenarios[i, 2] <- scenarios[i - 1, 1]
  scenarios[i, 3] <- scenarios[i - 1, 2]
  scenarios[i, 4] <- scenarios[i - 1, 1] + scenarios[i - 1, 2] + scenarios[i - 1, 3] + scenarios[i - 1, 4] + scenarios[i - 1, 5] + scenarios[i - 1, 6]
  scenarios[i, 5] <- scenarios[i - 1, 4] 
  scenarios[i, 6] <- scenarios[i - 1, 5] 
}

sum (scenarios[30, ])