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
  if(file.info(d)$size > 0) {
  dep<-read.table(file=d,header=F,sep="\t",stringsAsFactors = F)
  dist<- c(dist,median(dep[,3]))
    }
}
write(min(dist),depthOutput)
#----------------------------------------------------------------------
vcf.files <- list.files(vcfPath, full.names = T)
qual <- c()
for (q in vcf.files) {
  if(file.info(q)$size > 7930) {
  vcf <- read.table(file=q)
  qual <- c(qual,median(vcf[,6]))
    }
}
quality<- as.integer(min(qual))
write(quality,qualityOutput)
 
