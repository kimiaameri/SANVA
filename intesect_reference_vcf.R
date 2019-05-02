
argv <- commandArgs(trailingOnly = TRUE)

intesect_reference_vcf <- function(i, reference,intersectionspath){
  file = (paste0(intersectionspath,i,sep="")
  if(file.info(file)$size > 0) {
   intersections <- as.matrix(read.table(paste0(intersectionspath,i,sep=""),header=F,sep="\t",stringsAsFactors = F))
    length.intersection= nrow(intersections)
    length.genome= nrow(reference)
    for (j in 1 :length.genome)
    { 
        for (i in 1:length.intersection)
          if (intersections[i,2] >= reference[j,2] & intersections[i,2] <= reference[j,3]) 
              intersections[i,4] = reference [j,4]
    }
  return(table(intersections[,4]))
     }
}
