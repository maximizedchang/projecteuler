maxf <- function(H){
  return ((3*H - 1000)/2000)
}
for(H in 1000:0){
  total <- (1 + 2*maxf(H))^H*(1 - maxf(H))^(1000-H)
  if(total < 1000000000){
    minH <- (H + 1)
    break
  }
}
answer <- 0
for(i in minH:1000){
  answer <- answer + choose(1000, i)
}
answer <- answer * (0.5)^1000
print(answer)