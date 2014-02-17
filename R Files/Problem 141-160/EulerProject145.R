reverse <- function(x){
  test <- strsplit(as.character(x), NULL)[[1]]
  test_rev <- rev(test)
  return(as.numeric(paste(test_rev, collapse = "")))
}
# 
odds <- c(1, 3, 5, 7, 9)
# 
hasOnlyOddDigits <- function(x){
  while(x > 0){
    digit <- (x %% 10)
    if(!(digit %in% odds)){
      return (FALSE)
    }
    x <- floor(x / 10)
  }
  return (TRUE)
}
# 
# count <- 0
# number <- 1
# while(number < 1000000000){
#   if(number %% 10 != 0){
#     total <- number + reverse(number)   
#     if(hasOnlyOddDigits(total)){
#       count <- count + 1
#     }
#   }
#   number <- number + 1
# }
# print(count)

analyze <-function(digits){
  number <- 0
  rev <- 0
  for(i in length(digits):1){
    number <- number *10 + digits[i]
    rev <- rev*10 +digits[length(digits) - i + 1]
  }
  return (hasOnlyOddDigits(number + rev))
}

construction <- function(digits, position, carryOver){
  total <- 0
  if(position == length(digits)/2){
    for(digit in 0:9){
      if(position == 1 & digit == 0) next
      digits[position + 1] <- digit
      if(analyze(digits)){
        total <- total + 1
      }
    }
    return (total)
  }
  if(position > length(digits)/2){
    if(analyze(digits)){
      return (1)
    } else {
      return (0)
    }
  }
  for(digit in 0:9){
    if(position == 1 & digit == 0) next
    psum <- (digits[position] + digit + carryOver)
    if(psum %% 2 == 1){
      digits[length(digits) + 1 - position] <- digit
      if(psum > 9){
        for(nextDigit in 0:9){
          digits[position + 1] <- nextDigit
          total <- total + construction(digits, position + 1, 1)
        }
        
      } else {
        for(nextDigit in 0:9){
          digits[position + 1] <- nextDigit
          total <- total + construction(digits, position + 1, 0)
        }
      }
    }
  }
  return(total)
}


total <- 0
for(digitCount in 9:9){
  for(firstDigit in 1:9){
    number <- rep(0, digitCount)
    number[1] <- firstDigit
    total <- total + construction(number, 1, 0)
  }
}
print(total)
