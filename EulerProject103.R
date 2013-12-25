finaltotal = 255
result = 0
for(a in 20:24){
  for(b in (a+1):33){
    for(c in (b+1):40){
      for(d in (c+1):41){
        for(e in (d+1):42){
          for(f in (e+1):44){
            for(g in (f+1):47){
              if(a+b+c+d+e+f+g <= finaltotal){
                if(a+b+c+d>e+f+g){
                  numbers <- c(a, b, c, d, e, f, g)
                  pairsTest <- TRUE
                  triplesTest <- TRUE
                  pairs <- c()
                  triples <- c()
                  for(index1 in 1:6){
                    for(index2 in (index1 + 1):7){
                      total <- numbers[index1] + numbers[index2]
                      if(total %in% pairs){
                        pairsTest <- FALSE
                      } else {
                        pairs <- c(pairs, total)
                      }
                      if(!pairsTest) break;
                    }
                    if(!pairsTest) break;
                  }
                  for(index1 in 1:5){
                    for(index2 in (index1 + 1):6){
                      for(index3 in (index2 + 1):7){
                        total <- numbers[index1] + numbers[index2] + numbers[index3]
                        if(total %in% triples){
                          triplesTest <- FALSE
                        } else {
                          triples <- c(triples, total)
                        }
                        if(!triplesTest) break;
                      }
                      if(!triplesTest) break;
                    }
                    if(!triplesTest) break;
                  }
                  if(triplesTest & pairsTest){
                    finaltotal <- a+b+c+d+e+f+g
                    result <- numbers    
                    print(numbers)
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
print(result)