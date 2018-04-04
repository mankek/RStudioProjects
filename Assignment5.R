Ordered_Weather <- function(x, y){
  file<-read.csv(gzfile("C:\\Users\\krmanke\\RStudioProjects\\Assignments\\2017_Storm_Events.csv.gz"), stringsAsFactors = FALSE)
  events = file$EVENT_TYPE
  table<-sort(table(events), decreasing = TRUE)
  return(table[x:y])
}

Ordered_Weather(2, 4)


