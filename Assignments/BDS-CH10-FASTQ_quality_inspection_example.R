# trim_qual.R Explore base qualities before and after trimming
library(qrqc)

#FASTQ files
fqfiles<-c(none="untreated1_chr4.fq", sickle="untreated1_chr4_trimmed.fq", trimfq = "untreated1_chr4_trimfq.fq")

#Load in each file using qrqc's readSeqFile
#We only need qualities, so we turn off some of readSeqFile's other features
seq_info<-lapply(fqfiles, function(file) {
  readSeqFile(file, hash=FALSE, kmer=FALSE)
})

#Extract the qualities as dataframe, and append
#a column of which trimmer (or none) was used.
#This is used in later plots
quals<-mapply(function(sfq, name) {
  qs <- getQual(sfq)
  qs$trimmer<-name
  qs
}, seq_info, names(fqfiles), SIMPLIFY = FALSE)

#Combine seperate dataframes in a list into single dataframe
d<-do.call(rbind, quals)

#Visualize qualities
p1<-ggplot(d) + geom_line(aes(x=position, y=mean, linetype=trimmer))
p1<-p1 + ylab("mean quality (sanger)") + theme_bw()
print(p1)

#Use qrqc's qualPlot with list produces panel plots
#Only shows 10% to 90% quantile and lowess curve
p2<-qualPlot(seq_info, quartile.color = NULL, mean.color = NULL) + theme_bw()
p2<-p2 + scale_y_continuous("quality (sanger)")
print(p2)
