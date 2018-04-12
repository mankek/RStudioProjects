s <- "Python and R R Both Gr8 Languages!"
s_split<-strsplit(s, NULL)
index<-1
for (i in s_split[[1]]){
  if(length(grep("[a-z]", i)) > 0){
    s_split[[1]][index] <- toupper(i)
    index<-index+1
  } else if (length(grep("[A-Z]", i)) > 0) {
    s_split[[1]][index] <- tolower(i)
    index=index+1
  } else {
    index=index+1
    next
  }
}
s_split_v<-as.vector(s_split[[1]])
cat(s_split_v)


  
