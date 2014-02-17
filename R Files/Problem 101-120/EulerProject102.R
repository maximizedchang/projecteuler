adjustAngle <- function(theta, x, y){
  if(x >= 0){
    return (theta)
  } 
  return (theta - pi)
}

isBetween <- function(a, x, y){
  start <- 0
  finish <- 0
  if(max(x, y) - min(x, y) <= pi){
    start <- min(x, y)
    finish <- max(x, y)
    return (a > start & a < finish)
  } else {
    start <- max(x, y)
    finish <- min(x, y)
  }
  if(finish < 0){
    finish <- finish + 2*pi
  }
  if(a < 0){
    a <- a + 2*pi
  }
  return (a > start & a < finish)
}

total <- 0
for(i in 1:1000){
  ax <- triangles[i, 1]
  ay <- triangles[i, 2]
  bx <- triangles[i, 3]
  by <- triangles[i, 4]
  cx <- triangles[i, 5]
  cy <- triangles[i, 6]
  thetaa1 <- atan((by - ay)/(bx - ax))
  thetaa2 <- atan((cy - ay)/(cx - ax))
  thetab1 <- atan((ay - by)/(ax - bx))
  thetab2 <- atan((cy - by)/(cx - bx))
  thetaa1 <- adjustAngle(thetaa1, bx - ax, by - ay)
  thetaa2 <- adjustAngle(thetaa2, cx - ax, cy - ay)
  thetab1 <- adjustAngle(thetab1, ax - bx, ay - by)
  thetab2 <- adjustAngle(thetab2, cx - bx, cy - by)
  thetaa <- adjustAngle(atan(ay/ax), -ax, -ay)
  thetab <- adjustAngle(atan(by/bx), -bx, -by)
  if(isBetween(thetaa, thetaa1, thetaa2) & isBetween(thetab, thetab1, thetab2)){
    total <- total + 1
  }
}
print(total)