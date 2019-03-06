#-------------------- find quality distribuison --------------------#

#-------------------- find depth distribuison --------------------#
argv <- commandArgs(trailingOnly = TRUE)
depthPath <- argv[1]
vcfPath <- argv[2]
depthOutput <- argv[3]
qualityOutput <- argv[4]

depth.files<- list.files(depthPath, full.names=T)
dist<-c()
for (d in depth.files){
  dep<-read.table(file=d,header=F,sep="\t",stringsAsFactors = F)
  dist<- c(dist,min(dep[,3]))
}
write(median(dist),depthOutput)
#----------------------------------------------------------------------
vcf.files <- list.files(vcfPath, full.names = T)
qual <- c()
for (q in vcf.files) {
  vcf <- read.table(file=q)
  qual <- c(qual,min(vcf[,6]))
}
quality<- as.integer(mean(qual))
write(quality,qualityOutput)
 
