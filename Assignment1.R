a<-4
b<-10
s<-0
for (i in a:b) {
  if(i%%2 != 0) {
    s<-s+i
  }
}
print(s)

