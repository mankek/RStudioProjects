file_name<-("C:\\Users\\krmanke\\RStudioProjects\\Assignments\\Assignment6\\Assignment6\\")
files<-list.files(file_name)
Event_Count<-vector()
Year<-vector()
index<-1
for (i in files){
  unzipped_file<-read.csv(paste(file_name, i, sep = ""), stringsAsFactors = FALSE)
  Event_Count<-append(Event_Count, sum(table(unzipped_file$EVENT_TYPE)))
  Year<-append(Year, substr(i, 1, 4))
}
event_table<-cbind.data.frame(Year, Event_Count, deparse.level = 0)
print(event_table)




