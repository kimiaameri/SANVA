#-------------------- find quality distribuison --------------------#

#-------------------- find depth distribuison --------------------#
argv <- commandArgs(trailingOnly = TRUE)
depthPath <- argv[1]
vcfPath <- argv[2]
depthOutput <- argv[3]
qualityOutput <- argv[4]

depth.files<- list.files(depthPath, full.names=T)
dist<-c()
for (f in depth.files){
  dep<-read.table(file=f,header=F,sep="\t",stringsAsFactors = F)
  dist<- c(dist,median(dep[,3]))
}
write(median(dist),depthOutput)
#----------------------------------------------------------------------
vcf.files <- list.files(vcfPath, full.names = T)
qual <- c()
for (f in vcf.files) {
  vcf <- read.table(file=f)
  qual <- c(qual,median(vcf[,6]))
}
quality<- as.integer(median(qual))
write(quality,qualityOutput)
 
