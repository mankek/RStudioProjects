s<-c("A","A","A","A","C","C","C","G","G","T")
index<-1
for (i in s) {
  if(i=="A") {
    s[index]<-"T"
    index<-index+1
  } else if(i=="T") {
    s[index]<-"A"
    index<-index+1
  } else if(i=="G") {
    s[index]<-"C"
    index<-index+1
  } else {
    s[index]<-"G"
    index<-index+1
  }
  
}
reversecomp <- rev(s)
print(reversecomp)


  
