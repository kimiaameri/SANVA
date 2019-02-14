setwd("./")
source("./source/Inputs.R")
source("./source/permutationTest.R")
source("./source/BlastFindings.R")
source("./source/MutationPosition.R")
source("./source/GenePosition.R")
source("./source/Filters.R")
source("./source/FisherTest.R")

#-----------------------------------------------------------------------#
#                             read bedfiles                             #
#-----------------------------------------------------------------------#
reference_Genome <- as.matrix(read.table("./input/nctc8325.bed",header=F,sep="\t",stringsAsFactors = F))
length.genome= nrow(reference_Genome)
intersections<- list.files("./input/intersections/")
gene.length<- as.numeric(reference_Genome[,3]) - as.numeric(reference_Genome[,2])
reference_Genome<-cbind(reference_Genome,gene.length)
#-----------------------------------------------------------------------#
#            calculate number of mutations per each gene                #
#-----------------------------------------------------------------------#
bigtable <- matrix(0,nrow=length(reference_Genome[,4]),ncol=length(intersections))
rownames(bigtable) <- reference_Genome[,4]
colnames(bigtable) <- intersections
bigtable.norm<-bigtable
for (i in 1:length(intersections))
{
  res <- intesect.reference.vcf(intersections[i],reference_Genome)
  bigtable[names(res),i] <-  as.numeric(res) 
  bigtable.norm[names(res),i] <-  as.numeric(res) / as.numeric(reference_Genome[i,10])
}
bigtable <- bigtable[rowSums(bigtable) != 0,]
bigtable.norm <- bigtable.norm[rowSums(bigtable.norm) != 0,]
columnnames<- gsub(pattern = "intersect-",replacement = "",intersections, perl = T)
columnnames<- gsub(pattern = "_q5000_dp250.bed",replacement = "",columnnames, perl = T)
#---------------
X1<-bigtable[,c(1:5)]
X2<-bigtable[,c(9:10)]
X3<-bigtable[,c(6:8)]
X4<-as.matrix(bigtable[,11])
bigtable<- as.matrix(cbind(X1,X2,X3,X4))
#----------------
X1<-bigtable.norm[,c(1:5)]
X2<-bigtable.norm[,c(9:10)]
X3<-bigtable.norm[,c(6:8)]
X4<-as.matrix(bigtable.norm[,11])
bigtable.norm<- as.matrix(cbind(X1,X2,X3,X4))
#-------------------------------------------------------------------------#
#                 lable High and Low samples in table                     #
#-------------------------------------------------------------------------#
group <- c(rep("H",7),rep("L",4))
isolates<- c("HSS12071M1","Silverman37712B1_S21","Silverman60383B1_S18","Silverman62129B1_S17", "Silverman79414A1_S23","Silverman99382M1_S15","Silverman99624A1_S20","Silverman93954A1_S19", "Silverman94232M1_S14", "Silverman99382B1_S22" ,"Silverman99624D1_S16")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
colnames(bigtable)<- paste(group,"_",isolates)
colnames(bigtable.norm)<- paste(group,"_",isolates)
annotation <- matrix(group)
rownames(annotation) <- isolates
write.csv(x =bigtable,file="./output/bigtable.csv" )
write.csv(x =bigtable.norm,file="./output/bigtable.normal.csv" )
#-------------------------------------------------------------------------#
#             find significant genes by permutation test                  #
#-------------------------------------------------------------------------#
significatGenes<-permutationTest(bigtable.norm)
write.csv(x =significatGenes,file="./output/significatGenes.csv" )
