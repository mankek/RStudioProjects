# Load sequences
sequence_file<-"C:\\Users\\krmanke\\Documents\\My Received Files\\Sequences.txt"
text<-read.table(file = sequence_file, stringsAsFactors = FALSE, col.names = c("Sequence Number", "cDNA Sequence"))
split_seq<- strsplit(text$cDNA.Sequence, NULL)


#Load codon table
codon_file<-"C:\\Users\\krmanke\\Documents\\My Received Files\\Codon_Map.txt"
codon_table<-read.table(file = codon_file, stringsAsFactors = FALSE, col.names = c("Codon", "Amino Acid"))
codon_table_t<-gsub("U", "T", codon_table$Codon)
split_codon<-strsplit(codon_table_t, NULL)
names(split_codon) <- codon_table$Amino.Acid

#Matching rna sequence to codons (assuming sequence is always divisible by 3)
index1<-1
index2<-1
sequence_1_protein<-vector()
sequence_2_protein<-vector()
for (i in 1:length(split_seq)){
  for (n in 1:length(split_seq[[i]])){
    if ((n+2)%%3 != 0){
      next
    }else {
      for (m in 1:length(split_codon)) {
        if ((split_codon[[m]][1]) == split_seq[[i]][n] && (split_codon[[m]][2]) == split_seq[[i]][n+1] && (split_codon[[m]][3]) == split_seq[[i]][n+2]){
          if (i == 1){
            sequence_1_protein[index1]<-names(split_codon[m])
            index1<-index1+1
          }else {
            sequence_2_protein[index2]<-names(split_codon[m])
            index2<-index2+1
          }
          break
          
          
        }else{
          next
          
        }
      }
    }
  }
}
sequence_1_protein
sequence_2_protein
        
      
       





