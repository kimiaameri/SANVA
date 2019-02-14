permutationTest<- function(bigtable.norm)
{
  ##------------------ find significant genes for normal table -------##
  x<- bigtable.norm
  y<-as.matrix( c(rep(1,7),rep(0,4)))
  n = 1000
  
  ndist<- matrix(ncol=n, nrow=nrow(x))
  set.seed(1)
  
  np.value<- rep(NA,nrow(x))
  for (i in 1: nrow(x))
  {
    ndist<- replicate(n,diff(by(x[i,],sample(y,length(y),FALSE),mean)))
    print(i)
    np.value[i] <- sum(ndist > diff(by(x[i,],y, mean)))/n
  }
  np.value.left <- 1 - np.value
  np.twotail <- pmin(np.value,np.value.left)
  np.adjusted <- p.adjust(np.twotail,method="fdr")<0.0005
  sig.normalgenes<-bigtable.norm[np.adjusted,]
  
  return(sig.normalgenes)
}
