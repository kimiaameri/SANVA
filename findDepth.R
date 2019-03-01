#-------------------- find quality distribuison --------------------#

#-------------------- find depth distribuison --------------------#


argv <- commandArgs(trailingOnly = TRUE)
vcfPath <- argv[1]
folderPath <- argv[2]
depthOutput <- argv[3]
qualityOutput <- argv[4]
summaryFile <- argv[5]

#folderPath <- argv[1]
#vcfPath <- argv[2]
#depthOutput <- argv[3]
#qualityOutput <- argv[4]
#summaryFile <- argv[5]
#files<- list.files("~/Dropbox/lugdunensis/depth/")
files<- list.files(vcfPath)

dist<-NULL

for (i in 1:length(files))
{
  dep<-read.table(paste(vcfPath,files[i],sep=""),header=F,sep="\t",stringsAsFactors = F)
  x<- dep[,3]
  dist<- cbind(dist,x)
}
means<- as.matrix(apply(dist,2,mean))

z<-as.data.frame(summary(dist))
minValue  <- min(z[,4])
write(minValue,outputFile)
write.table(z,summaryFile)

vcf.files <- depthOutput(folderPath, full.names = T)
qual <- c()
for (f in vcf.files) {
  vcf <- read.table(file=f)
  qual <- c(qual,average(vcf[,6]))
}
write(min(qual),qualityOutput)
 
