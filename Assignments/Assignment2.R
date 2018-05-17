t<-scan("Julius_Caesar_Act_2_Scene_3.txt", what = character(), sep = "\n")
for(i in 1:length(t)) {
  if(i%%2==0) {
    print(t[i])
  }
}