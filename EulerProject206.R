number <- 101010103
while(number < 138902662){
  square <- (number^2 + 1)
  compare <- 8
  square <- floor(square /100)
  #print(square)
  while(square > 100){
    digit <- square %% 10
    square <- floor(square/100)
    if(digit != compare){
      break
    }
    compare <- compare - 1
  }
  if(digit == 2 & square == 1){
    print (number)
    break
  }
  if(number %% 10 == 3){
    number <- number + 4
  } else {
    number <- number + 6
  }
}