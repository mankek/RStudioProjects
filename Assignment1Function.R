p1<-function(x,y){
  a<-0
  for (i in x:y) {
    if(i%%2 != 0) {
      a<-a+i
    }
  }
  return(a)
}

p1(10,20)
