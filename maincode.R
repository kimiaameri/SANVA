rgv <- commandArgs(trailingOnly = TRUE)
source<- argv[1]
bedpath <- argv[2]
intersectionspath<- argv[3]
outpath <-argv[4]

source(paste0(source,"/Inputs.R"))
source(paste0(source,"/permutationTest.R"))
source(paste0(source,"/BlastFindings.R"))
source(paste0(source,"/MutationPosition.R"))
source(paste0(source,"/GenePosition.R"))
source(paste0(source,"/Filters.R"))
source(paste0(source,"/FisherTest.R"))

#-----------------------------------------------------------------------#
#                             read bedfiles                             #
#-----------------------------------------------------------------------#
reference_Genome <- as.matrix(read.table(paste0(bedpath,"/nctc8325.bed"),header=F,sep="\t",stringsAsFactors = F))
length.genome= nrow(reference_Genome)
intersections<- list.files(paste0(intersectionspath,"/intersections/"))
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
columnnames<- gsub(pattern = ".bed",replacement = "",intersections, perl = T)
#---------------

#-------------------------------------------------------------------------#
#                 lable High and Low samples in table                     #
#-------------------------------------------------------------------------#
group <- c(rep("H",7),rep("L",4))
isolates<- c("HSS12071M1","Silverman37712B1_S21","Silverman60383B1_S18","Silverman62129B1_S17", "Silverman79414A1_S23","Silverman99382M1_S15","Silverman99624A1_S20","Silverman93954A1_S19", "Silverman94232M1_S14", "Silverman99382B1_S22" ,"Silverman99624D1_S16")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
colnames(bigtable)<- paste(group,"_",isolates)
colnames(bigtable.norm)<- paste(group,"_",isolates)
annotation <- matrix(group)
rownames(annotation) <- isolates
write.csv(x =bigtable,file=paste0(outpath,"/bigtable.csv") )
#-------------------------------------------------------------------------#
#             find significant genes by permutation test                  #
#-------------------------------------------------------------------------#
significatGenes<-permutationTest(bigtable.norm)
write.csv(x =significatGenes,file=paste0(outpath,"/significatGenes.csv" ))
