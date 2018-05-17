vcf_file_1<-"C:\\Users\\krmanke\\RStudioProjects\\Assignments\\DL-18-21094_HaplotypeCaller.vcf"
vcf_file_2<-"C:\\Users\\krmanke\\RStudioProjects\\Assignments\\DL-18-21094_NextGENe.vcf"
vcf_table_1<-read.table(vcf_file_1, stringsAsFactors = FALSE)
vcf_table_2<-read.table(vcf_file_2, stringsAsFactors = FALSE)

variants_1<-vector()
variants_2<-vector()

for (index in 1:length(vcf_table_1$V1)){
  variants_1<-append(variants_1, paste(vcf_table_1$V1[index], vcf_table_1$V2[index], sep = "-"))
}
for (i in 1:length(vcf_table_2$V1)){
  variants_2<-append(variants_2, paste(vcf_table_2$V1[i], vcf_table_2$V2[i], sep = "-"))
}

diffs_1<-setdiff(variants_1, variants_2)
diffs_2<-setdiff(variants_2, variants_1)

cat("The following Chromosome-Position pair is in the HaplotypeCaller file and not in the NextGENe file: ", diffs_1)

cat("The following Chromosome-Position pair is in the NextGENe file and not in the HaplotypeCaller file: ", diffs_2)