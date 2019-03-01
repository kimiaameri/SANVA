#-------------------- find quality distribuison --------------------#

#-------------------- find depth distribuison --------------------#


argv <- commandArgs(trailingOnly = TRUE)
depthPath <- argv[1]
vcfPath <- argv[2]
depthOutput <- argv[3]
qualityOutput <- argv[4]
#summaryFile <- argv[5]

depth.files<- list.files(depthPath, full.names=T)
dist<-c()
for (f in depth.files)
{
  dep<-read.table(file=f,header=F,sep="\t",stringsAsFactors = F)
  x<- median(dep[,3])
  dist<- c(dist,x)
}
#means<- apply(dist,2,mean)
#z<-as.data.frame(summary(dist))
#minValue  <- min(dist)
write(median(dist),depthOutput)
#write.table(z,summaryFile)

vcf.files <- list.files(vcfPath, full.names = T)
qual <- c()
for (f in vcf.files) {
  vcf <- read.table(file=f)
  qual <- c(qual,median(vcf[,6]))
}
write((median(qual),qualityOutput)
 
