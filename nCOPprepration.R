argv <- commandArgs(trailingOnly = TRUE)
Bigtable <- argv[1]
Stringinteraction <- argv[2]
Stringmapping <- argv[3]
PPI <- argv[4]
MUTATIONAL<-argv[5]
WEIGHT<- argv[6]
#----------------------------------------------
#-----------------------------------
library(ggplot2)
library(pheatmap)
library(dplyr)
#---------------------------------------
interactions<-read.csv(Stringinteraction , sep = "", header = FALSE)
mapping<-read.csv(Stringmapping , sep=":",header = FALSE)
#namess<- gsub(pattern = "1280.",replacement = "",mapping[,4], perl = T)
#mapping[,4]<- namess
PPI.mapping1<- NULL
for(i in 1:nrow(interactions))
{
  for (j in 1:nrow(mapping))
  {
    if (as.character(interactions[i,5]== mapping[j,4] ))
    {
      m<- cbind(as.character(mapping[j,2]),as.character( interactions[i,1]))
      PPI.mapping1<- rbind( PPI.mapping1,m)
      break(j)
    }
  }
 # print(i)
}
PPI.mapping2<- NULL
for(i in 1:nrow(interactions))
{
  for (j in 1:nrow(mapping))
  {
    if (as.character(interactions[i,6]== mapping[j,4] ))
    {
      m<- cbind(as.character(mapping[j,2]),as.character( interactions[i,2]))
      PPI.mapping2<- rbind( PPI.mapping2,m)
      break(j)
    }
  }
#  print(i)
}
PPI.mapping<- cbind(PPI.mapping1[,1], PPI.mapping2[,1])
write.table(PPI.mapping, PPI, col.names = F, row.names = F , quote=FALSE)


#----------------------------- mutational file -----------------------#
isolates<- read.csv(Bigtable, header = TRUE)
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
write.table(mutational, MUTATIONAL, col.names = F, quote=FALSE)
#------------------weighttable--------------------
#rownames(tablegenes)<- tablegenes[,1]
#tablegenes<- tablegenes[,-1]
z<- apply(isolates,1,mean)
write.table(z, WEIGHT,  col.names = F,  quote=FALSE)

