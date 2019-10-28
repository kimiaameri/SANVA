argv <- commandArgs(trailingOnly = TRUE)
Referecepath <- argv[1]
Bigtable <- argv[2]
Genelist <- argv[3]
Genetxt <- argv[4]
bigtableFile <- argv[5]
bigtableWeightFile<-argv[6]
#----------------------------------------------
library(devtools)
library(genbankr)
library(Biostrings)
library(bio3d)
#----------------------------------------
gb = readGenBank(paste0(Referecepath,"/CP000253.gb",sep=""))
gene_list <- mcols(genes(gb))[,c(2,5)]
zz<- gene_list$locus_tag
gene_list<- as.matrix(zz)

translation<- NULL 
tablegenes<-read.csv(Bigtable , sep = ",", header = TRUE)
tablegenes <- tablegenes[rowSums(tablegenes[,-1]) != 0,]
for(i in 1:nrow(gene_list))
{
  for (j in 1:nrow(tablegenes))
  {
    if (as.character(gene_list[i,1]== tablegenes[j,1] ))
    {
      translation<- rbind(translation,gene_list[i,])
      break(j)
    }
  }
  print(i)
}
write.csv(translation, Genelist)
write(as.character(translation[,1]), Genetxt)
