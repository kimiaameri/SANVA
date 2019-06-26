argv <- commandArgs(trailingOnly = TRUE)

Isolates<-argv[1]
NCOP<-argv[2]
HeatMap<- argv[3]
GGPLOT<- argv[4]

#----------------------------------------------
library(ggplot2)
library(pheatmap)
library(dplyr)
#---------------------------------------


isolates<- read.csv(Isolates, header = TRUE)
rownames(isolates)<- isolates[,1]
isolates<- isolates[,-1]


nCop<- read.csv(NCOP, header = FALSE, sep="")
colnames(nCop)<- c("Gene name","Frequency")
rName<-row.names(isolates)

heatmaptable<- NULL
for (i in 1 : nrow(nCop))
{
  for (j in 1:nrow(isolates))
  {
    if (as.character(nCop[i,1]==rName[j]))  {
      heatmaptable<-rbind(heatmaptable,isolates[j,])
      break(j) }}
  #print(i)
}

heat<- pheatmap(heatmaptable)
#write<-(heat,HeatMap)
#------------------------------------------------------------------------------------#
#                                                                                    #
#                          find the mutation rank in the genes                       #
#                                                                                    #
#------------------------------------------------------------------------------------#
weight.mutation<-rowSums(isolates)/ncol(isolates)
mutation <- as.matrix(sort(weight.mutation,decreasing = TRUE))
mutation.Rate <- rownames(mutation)
mutation<- cbind(mutation,1:nrow(mutation))
mutation<- as.data.frame(mutation)
ncoplist<- c(as.character(final_table[,1]))
#PPI<-NULL
PPI<-read.csv(PPI_string, sep="", header=FALSE)
PPIflat<-as.matrix(append(PPI[,1],PPI[,2]))
rownames(PPIflat)<-PPIflat[,1]
PPIflat<-unique(PPIflat)
genes<-NULL
genes<- mutation[PPIflat,]

genes<-genes[order(genes$V1,decreasing = TRUE),]
genes[,2]<- c(1:nrow(genes))
HighlyMuatted<- c(as.character(rownames(genes[1:2,])))
label1<- NULL
label2<- NULL
for (i in 1:nrow(genes))
  for (j in 1:length(ncoplist))
    if (rownames(genes[i,])==ncoplist[j] ) 
    {
      label1[i]= as.character(ncoplist[j])
      label2[i]= as.character("nCOP")
    }
for(i in 1:length(label1))
  if (as.character(is.na(label1[i]))) label2[i]<- as.character("PPI")
label2[1:2]<- as.character("HighlyMuattedinPPI")

genes[,3]<- label2
label1[1:2]<- HighlyMuatted
genes<- as.data.frame(genes)

gplot<- ggplot(genes, aes(y=V1, x=V2,color= factor(V3))) + geom_point() +
  geom_text(label=label1, size = 2,hjust=-0.2,vjust = 1,angle = 90) +
  labs(x="Genes", y="Mutation Rate",fill="")+
  ggtitle("nCOP Identifies Rarely Mutated Genes")+
  ylim(0,max(as.numeric(genes$V1)+1))+
  theme(legend.title = element_blank())
write<-(gplot ,GGPLOT)
