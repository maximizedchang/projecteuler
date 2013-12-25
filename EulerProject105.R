generatePermutationSums <- function(remaining, set1, set2){
  if(length(set1) == length(set2) & length(set1) != 0){
    if(analyzeSets(set1, set2)){
      return (TRUE)
    }
  }
  if(length(remaining) == 0){
    return (FALSE)
  }
  nextNumber <- remaining[1]
  remaining <- remaining[-1]
  if(generatePermutationSums(remaining, c(set1, nextNumber), set2)){
    return (TRUE)
  }
  if(generatePermutationSums(remaining, set1, c(set2, nextNumber))){
    return (TRUE)
  }
  if(generatePermutationSums(remaining, set1, set2)){
    return (TRUE)
  }
  return (FALSE)
}

analyzeSets <- function(set1, set2){
  return (sum(set1) == sum(set2))
}

total <- 0
for(i in 1:100){
  print(i)
  fail <- FALSE
  numbers <-as.numeric(strsplit(as.character(sets[i, 1]), ",")[[1]])
  numbers <- sort(numbers)
  for(j in 1:(length(numbers)-1)){
    if(numbers[j] == numbers[j + 1]){
      fail <- TRUE
      break
    }
  }
  if(fail){
    next
  }
  if(sum(numbers[1:floor(0.5*(length(numbers) + 1))]) <=
       sum(numbers[(length(numbers) - floor(0.5 * (length(numbers) - 1)) + 1):length(numbers)])){
      next
  }
  if(generatePermutationSums(numbers, c(), c())){
    next
  }
  total <- total + sum(numbers)
}