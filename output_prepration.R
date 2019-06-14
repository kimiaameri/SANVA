argv <- commandArgs(trailingOnly = TRUE)
nCOPtable <- argv[1]
Mutations <- argv[2]
FinalTable <- argv[3]
Isolates<-argv[4]
PPI<-argv[5]
HeatMap<- argv[6]
GGPLOT<- argv[7]

#----------------------------------------------
library(ggplot2)
library(pheatmap)
library(dplyr)
#---------------------------------------

nCop<- read.csv(nCOPtable, header = FALSE, sep="")
colnames(nCop)<- c("Gene name","Frequency")
Mutations_Genes<- read.csv(Mutations, header = FALSE, sep="")
rName<-Mutations_Genes[,1]
final_table<- NULL
for (i in 1 : nrow(nCop))
{
  for (j in 1:nrow(Mutations_Genes))
  {
    if (as.character(nCop[i,1]==rName[j])) 
    {
      l<- cbind(nCop[i,], Mutations_Genes[j,2])
      final_table<-rbind(final_table, l)
      break(j)
    }
  }
#print(i)
}

write.csv(final_table, FinalTable, quote=FALSE)
#---------
isolates<- read.csv(Isolates, header = TRUE)
rownames(isolates)<- isolates[,1]
isolates<- isolates[,-1]

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

heat<- pheatmap(t(heatmaptable))
write<-(heat,HeatMap)
print(heat)

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
PPI<-NULL
PPI<-PPI
rownames(PPI)<-PPI[,1]
PPI<-unique(PPI)
genes<-NULL
genes<- mutation[PPI,]

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
