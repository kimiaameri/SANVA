argv <- commandArgs(trailingOnly = TRUE)
InputPath <- argv[1]
OutputFile <- argv[2]


listdata<- list.files(InputPath)
listdata<- gsub(pattern = "_1.fastq",replacement = "",listdata, perl = T)
listdata<- gsub(pattern = "_2.fastq",replacement = "",listdata, perl = T)
listdata<- unique(listdata)

inputFile<-as.matrix(listdata) 
c1<- as.matrix(paste(as.character(inputFile[,1]),"_1.fastq", sep=""))
c2<- as.matrix(paste(as.character(inputFile[,1]),"_2.fastq", sep=""))
inputFile<- cbind(inputFile, c1, c2)

write.csv(inputFile,OutputFile)
