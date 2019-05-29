argv <- commandArgs(trailingOnly = TRUE)
sourcePath <- argv[1]
bedpath <- argv[2]
intersectionspath <- argv[3]
inputFiles <- argv[4]
bigtableFile <- argv[5]
bigtableWeightFile<-argv[6]
#----------------------------------------------



install.packages("devtools")
library(devtools)
install_git("https://git.bioconductor.org/packages/genbankr")
library(genbankr)
#source('https://bioconductor.org/biocLite.R')
#BiocManager::install("BiocUpgrade")
BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))
library(Biostrings)
library(bio3d)
#-----------------------------------
library(ggplot2)
library(pheatmap)
library(dplyr)
#----------------------------------------
gb = readGenBank("$SOURCE_DIR/sequence.gbk")
gene_list <- mcols(cds(gb))[,c(2,3)]
gene_list1<- gene_list$gene
gene_list2<- gene_list$locus_tag
gene_list<- cbind(gene_list1,gene_list2)

translation<- NULL 
tablegenes<-read.csv("$OUTPUT_PATH/bigtable.csv" , sep = ",", header = TRUE)
#tablegenes<-tablegenes[,c(1:8)]
#tablegenes <- tablegenes[rowSums(tablegenes[,-1]) != 0,]

for(i in 1:nrow(gene_list))
{
  for (j in 1:nrow(tablegenes))
  {
    if (as.character(gene_list[i,2]== tablegenes[j,1] ))
    {
      translation<- rbind(translation,gene_list[i,])
      break(j)
    }
  }
  print(i)
}
write.csv(translation, "../genomicMap/outputfiles/significat/Gene-list-SignificantGenes.CSV")
write(as.character(translation[,2]), "../genomicMap/outputfiles/significat/Genes.txt")
interactions<-read.csv("../genomicMap/outputfiles/significat//string_interactions.tsv" , sep = "", header = TRUE)
mapping<-read.csv("../genomicMap/outputfiles/significat//string_mapping.tsv" , sep="\t", header = TRUE)
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

#---------------------------
