bouncy <- 0#.9*21780
non_bouncy <- 99# .1*21780
current <- 99#21780

while(non_bouncy * 99 != bouncy){
  print(current)
  current <- current + 1
  up <- FALSE
  down <- FALSE
  number <- current
  digit <- number %% 10
  number <- floor(number / 10)
  while((!(up & down)) & number != 0){
    nextDigit <- number %% 10
    number <- floor(number / 10)
    if(nextDigit < digit){
      up <- TRUE
    }
    if(nextDigit > digit){
      down <- TRUE
    }
    digit <- nextDigit
  }
  if(up & down){
    bouncy <- bouncy + 1
  } else {
    non_bouncy <- non_bouncy + 1
  }
}