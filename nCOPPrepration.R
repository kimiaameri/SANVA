argv <- commandArgs(trailingOnly = TRUE)
bigtable <- argv[1]
string_interactions <- argv[2]
string_mapping <- argv[3]
PPI <- argv[4]
mutational <- argv[5]
weights<-argv[6]
#----------------------------------------------
library(ggplot2)
library(pheatmap)
library(dplyr)

#-----------------------------------------------
interactions<-read.csv(string_interactions , sep = "", header = TRUE)
mapping<-read.csv(string_mapping, sep="\t", header = TRUE)
PPI.mapping1<- NULL
for(i in 1:nrow(interactions))
{
  for (j in 1:nrow(mapping))
  {
    if (as.character(interactions[i,5]== mapping[j,3] ))
    {
      m<- cbind(as.character(mapping[j,2]),as.character( interactions[i,1]))
      PPI.mapping1<- rbind( PPI.mapping1,m)
      break(j)
    }
  }
  print(i)
}
PPI.mapping2<- NULL
for(i in 1:nrow(interactions))
{
  for (j in 1:nrow(mapping))
  {
    if (as.character(interactions[i,6]== mapping[j,3] ))
    {
      m<- cbind(as.character(mapping[j,2]),as.character( interactions[i,2]))
      PPI.mapping2<- rbind( PPI.mapping2,m)
      break(j)
    }
  }
  print(i)
}
PPI.mapping<- cbind(PPI.mapping1[,1], PPI.mapping2[,1])
write.table(PPI.mapping, "../genomicMap/outputfiles/significat/PPI_SignificantGenes.txt", col.names = F, row.names = F , quote=FALSE)


#----------------------------- mutational file -----------------------#
isolates<- read.csv("../genomicMap/sig.csv", header = TRUE)


rownames(isolates)<- isolates[,1]
isolates<- isolates[,-1]

numRow<- nrow(isolates)
mutational<- NULL
for (i in 1:numRow)
{
  vector= c()
  for (j in 1:ncol(isolates))
  {
    if(isolates[i,j]!=0) vector <- c(vector,colnames(isolates)[j])
  }
  v<-paste(vector , collapse =" ")
  mutational<- rbind(mutational,v)
}

rownames(mutational)<- rownames(isolates)
write.table(mutational, "../genomicMap/outputfiles/significat/mutational_SignificantGenes.txt", col.names = F, quote=FALSE)
#------------------weighttable--------------------
rownames(tablegenes)<- tablegenes[,1]
tablegenes<- tablegenes[,-1]
z<- apply(tablegenes,1,mean)
write.table(z, "../genomicMap/outputfiles/significat/weight_SignificantGenes.txt",  col.names = F,  quote=FALSE)
