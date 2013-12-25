#2
#2a
#n even : -na+1+na+1=2
#n odd: 2na
2a^2
2a^2 + 2a
2a^2 + 4a
sumrmax <- 0

for(a in 3:1000){
  rmax <- max(2, 2*a)
  n <- 3
  while(n <= 2*a){
    remainder <- ((2*n*a) %% (a^2))
    if(remainder > rmax){
      rmax <- remainder
    }
    n <- n + 2
  }
  sumrmax <- sumrmax + rmax
}
print(sumrmax)