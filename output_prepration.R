argv <- commandArgs(trailingOnly = TRUE)
nCOPtable <- argv[1]
Mutations <- argv[2]
FinalTable <- argv[3]


#----------------------------------------------
library(ggplot2)
library(pheatmap)
library(dplyr)
#---------------------------------------

nCop<- read.csv(nCOPtable, header = FALSE, sep="")
colnames(nCop)<- c("Gene name","Frequency")
Mutations_Genes<- read.csv(Mutations, header = FALSE, sep="")
rName<-Mutations_Genes[,1]
final_table<- NULL
for (i in 1 : nrow(nCop))
{
  for (j in 1:nrow(Mutations_Genes))
  {
    if (as.character(nCop[i,1]==rName[j])) 
    {
      l<- cbind(nCop[i,], Mutations_Genes[j,])
      final_table<-rbind(final_table, l)
      break(j)
    }
  }
#print(i)
}
final_table<- final_table[,-c(1:2)]
write.csv(final_table, FinalTable, quote=FALSE)
