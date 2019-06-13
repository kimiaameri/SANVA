argv <- commandArgs(trailingOnly = TRUE)
Referecepath <- argv[1]
Bigtable <- argv[2]
Genelist <- argv[3]
Genetxt <- argv[4]
bigtableFile <- argv[5]
bigtableWeightFile<-argv[6]
#----------------------------------------------



install.packages("devtools" , repos='http://cran.us.r-project.org')
library(devtools)
#install_git("https://git.bioconductor.org/packages/genbankr")
library(genbankr)
#source('https://bioconductor.org/biocLite.R')
#BiocManager::install("BiocUpgrade")
#BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))
#install.packages("Biostrings")
#install.packages("bio3d")

library(Biostrings)
library(bio3d)
#-----------------------------------
library(ggplot2)
library(pheatmap)
library(dplyr)
#----------------------------------------
gb = readGenBank(paste(Referecepath,"/CP000253.gb",sep=""))
gene_list <- mcols(cds(gb))[,c(2,3)]
gene_list1<- gene_list$gene
gene_list2<- gene_list$locus_tag
gene_list<- cbind(gene_list1,gene_list2)

translation<- NULL 
tablegenes<-read.csv("Bigtable" , sep = ",", header = TRUE)
tablegenes <- tablegenes[rowSums(tablegenes[,-1]) != 0,]
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
write.csv(translation, "Genelist")
write(as.character(translation[,2]), "Genetxt")
