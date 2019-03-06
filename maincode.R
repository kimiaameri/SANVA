
argv <- commandArgs(trailingOnly = TRUE)
sourcePath <- argv[1]
bedpath <- argv[2]
intersectionspath <- argv[3]
inputFiles <- argv[4]
high <- argv[5]
low <- argv[6]
outpath <-argv[7]

source(paste0(sourcePath,"/intesect_reference_vcf.R"))
source(paste0(sourcePath,"/permutationTest.R"))
#source(paste0(sourcePath,"/BlastFindings.R"))
#source(paste0(sourcePath,"/MutationPosition.R"))
#source(paste0(sourcePath,"/GenePosition.R"))
#source(paste0(sourcePath,"/Filters.R"))
#source(paste0(sourcePath,"/FisherTest.R"))

#-----------------------------------------------------------------------#
#                             read bedfiles                             #
#-----------------------------------------------------------------------#
reference_Genome <- as.matrix(read.table(paste0(bedpath,"/nctc8325-1.bed"),header=F,sep="\t",stringsAsFactors = F))
length.genome= nrow(reference_Genome)
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
  res <- intesect_reference_vcf(intersections[i],reference_Genome,intersectionspath)
  bigtable[names(res),i] <-  as.numeric(res) 
  bigtable.norm[names(res),i] <-  as.numeric(res) / as.numeric(reference_Genome[i,10])
}
bigtable <- bigtable[rowSums(bigtable) != 0,]
bigtable.norm <- bigtable.norm[rowSums(bigtable.norm) != 0,]
#-------------------------------------------------------------------------#
#                 lable High and Low samples in table                     #
#-------------------------------------------------------------------------#
#group <- c(rep("H",high),rep("L",low))
samples <- as.matrix(read.table(paste0(inputFiles),header=F,sep=",",stringsAsFactors = F))

sort.samples <- x[order(x$V2, na.last=NA) , ]
isolates<- sort.samples[,1]
group <- substr(sort.samples[,2],1,1)
colnames(bigtable)<- paste(group,"_",isolates)
colnames(bigtable.norm)<- paste(group,"_",isolates)
annotation <- matrix(group)
rownames(annotation) <- isolates
write.csv(x =bigtable,file=paste0(outpath,"/bigtable.csv") )
#-------------------------------------------------------------------------#
#             find significant genes by permutation test                  #
#-------------------------------------------------------------------------#
#significatGenes<-permutationTest(bigtable.norm, high, low)
#write.csv(x =significatGenes,file=paste0(outpath,"/significatGenes.csv" ))
#pheatmap(sig.normalgenes,cluster_cols=F, filename= paste0(source,"/Pheatmap.jpg"))

