t <- scan("Divisor_exercise.txt", skip=1)

for(i in t){
  lst<-vector()
  for(n in 2:(i-1)){
    if(i%%n==0){
      lst<-append(lst,n)
    }
  }
  if(length(lst)==0){
    cat(i, " is a prime\n", file ="Divisors.txt", append=TRUE)
  }else{
    cat("Divisors of ", i, ": ", lst, "\n", file = "Divisors.txt", append=TRUE)
  }
}

result<-capture.output





  
   

