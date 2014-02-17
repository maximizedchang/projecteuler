count <- 0
singles <- c(1:20, 25)
doubles <- c(1:20, 25)*2
triples <- c(1:20)*3
for(i in singles){
  total <- 2*i
  count <- count + 1
  for(j in 1:length(singles)){
     if(total + singles[j] < 100){
       count <- count + 1
     }
  }
  for(j in 1:length(doubles)){
    if(total + doubles[j] < 100){
      count <- count + 1
    }
  }
  for(j in 1:length(triples)){
    if(total + triples[j] < 100){
      count <- count + 1
    }
  }
  for(j in 1:length(singles)){
    for(k in j:length(singles)){
      if(total + singles[j] + singles[k] < 100){
        count <- count + 1
      }
    }
  }
  for(j in 1:length(doubles)){
    for(k in j:length(doubles)){
      if(total + doubles[j] + doubles[k] < 100){
        count <- count + 1
      }
    }
  }
  for(j in 1:length(triples)){
    for(k in j:length(triples)){
      if(total + triples[j] + triples[k] < 100){
        count <- count + 1
      }
    }
  }
  for(j in 1:length(singles)){
    for(k in 1:length(doubles)){
      if(total + singles[j] + doubles[k] < 100){
        count <- count + 1
      }
    }
  }
  for(j in 1:length(singles)){
    for(k in 1:length(triples)){
      if(total + singles[j] + triples[k] < 100){
        count <- count + 1
      }
    }
  }
  for(j in 1:length(doubles)){
    for(k in 1:length(triples)){
      if(total + doubles[j] + triples[k] < 100){
        count <- count + 1
      }
    }
  }
}