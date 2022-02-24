#install.packages("learnPopGen")
library(learnPopGen)
library(coala)
coalescent.plot()

library(coala)

model<-coal_model(sample_size=5, loci_number=10, loci_length=500, ploidy=2)+
  feat_mutation(10)+
  feat_recombination(10)+
  sumstat_trees()+
  sumstat_nucleotide_div()

library(phytools)
stats<-simulate(model, nsim=1)
Diversity<-stats$pi
#All of the numbers are not the same, the differenes are caused by 
Nloci<-length(stats$trees)
t1<-read.tree(text=stats$trees[[1]][1])
plot(t1)
axisPhylo()
Agel<-max(nodeHeights(t1))
Question #6 
t2<-read.tree(text=stats$trees[[2]][1])
axisPhylo()
Question #7 
par(mfrow=c(1,2))
plot(t1)
axisPhylo()
plot(t2)
axisPhylo()
compare.chronograms(t1, t2)
t1_1<-read.tree(text=stats$trees[[1]][1]) 
t1_2<-read.tree(text=stats$trees[[1]][2])
compare.chronograms(t1_1, t1_2)
for (locus in 1:Nloci) {
  ntrees<-length(stats$trees[[locus]])
  for (n in 1:ntrees){
    if(locus == 1 && n == 1) {
      outPhy<-read.tree(text=stats$trees[[locus]][n])
    }
    else {
      outPhy<-ape:::c.phylo(outPhy, read.tree(text=stats$trees[[locus]]))
    }
  }
}
par(mfrow=c(1,1))
densityTree(outPhy)    
model3<-coal_model(10, 50)+
  feat_mutation(par_prior("theta", sample.int(100, 1)))+
  sumstat_nucleotide_div()
stats<-simulate(model3, nsim=40)
mean_pi<-sapply(stats, function(x) mean(x$pi))
theta<-sapply(stats, function(x) x$spars[["theta"]])
plot(mean_pi)
plot(theta)
x<-mean_pi
y<-theta
plot(mean_pi, theta)

