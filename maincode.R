
argv <- commandArgs(trailingOnly = TRUE)
sourcePath <- argv[1]
bedpath <- argv[2]
intersectionspath <- argv[3]
inputFiles <- argv[4]
bigtableFile <- argv[5]
bigtableWeightFile<-argv[6]

source(paste0(sourcePath,"/intesect_reference_vcf.R"))


#-----------------------------------------------------------------------#
#                             read bedfiles                             #
#-----------------------------------------------------------------------#
reference_Genome <- as.matrix(read.table(paste0(bedpath,"/nctc8325-1.bed"),header=F,sep="\t",stringsAsFactors = F))
length.genome <- nrow(reference_Genome)
intersections<- list.files(intersectionspath)
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
  if(names(res) != ".") {
  res <- intesect_reference_vcf(intersections[i],reference_Genome,intersectionspath)
  bigtable[names(res),i] <-  as.numeric(res) 
  bigtable.norm[names(res),i] <-  as.numeric(res) / as.numeric(reference_Genome[i,10])
}}
bigtable <- bigtable[rowSums(bigtable)!= 0,]
bigtable.norm <- bigtable.norm[rowSums(bigtable.norm)!= 0,]
#-------------------------------------------------------------------------#
#            save genes that have mutation in isolates                    #
#-------------------------------------------------------------------------#
write.csv(bigtable,bigtableFile)
write.csv(bigtable.norm,bigtableWeightFile)
