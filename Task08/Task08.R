library(phytools)
library(ape)
text.string<-
  "(((((((cow, pig), whale), (bat, (lemur, human))), (robin, iguana)), coelacanth), (gold_fish, trout)), shark);"
vert.tree<-read.tree(text=text.string)
plot(vert.tree, edge.width=2)
nodelabels(frame="circle", bg='white', cex=1)
Question#1 Ibelieve that the shark is more closely related to the goldfish. There are less nodes in comparison to the distance between the human and goldfish.
vert.tree
Question#2 There are no branch lengths in this tree. 
str(vert.tree)
tree<-read.tree(text="(((A,B), (C,D)), E);")
plotTree(tree, offset=1)
tiplabels(frame="circle", bg='lightblue', cex=1)
nodelabels(frame="circle", bg='white', cex=1)
tree$tip.label
tree$edge
AnolisTree<-force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))
par(las=1)
hist(AnolisTree$edge.length, col='black', border='white', main="", xlab="edge lengths for the Anolis tree", ylim=c(0, 50), xlim=c(0,6))
tipEdges<-which(AnolisTree$edge[,2]<=Ntip(AnolisTree))
Lengths<-AnolisTree$edge.length
names(Lengths)<-AnolisTree$tip.label
names(Lengths)[which(Lengths == min(Lengths))]
plot(AnolisTree, cex=0.25)
Labs<-sapply(AnolisTree$edge.length, round, digits=2)
edgelabels(text=Labs, cex=0.25)
?plot.phylo
#Question3: plot(AnolisTree, tip.label=FALSE)
#Question 4: plot(AnolisTree, cex=0.25, type='fan')
warnings()
#Question 5: plot(AnolisTree, cex=0.25, tip.color='red')
#Question 6:
plot(AnolisTree, cex=0.25)
Labs<-sapply(AnolisTree$edge.length, round, digits=2)
edgelabels(text=Labs, cex=0.25)
which(Lengths == min(Lengths))
names(Lengths)
AnolisTree2<-drop.tip(AnolisTree, "Anolis_occultus")
plot(AnolisTree2, cex=0.25)
ltt(AnolisTree)
abline(0, 1, lwd=2, col='red', lty=2)
#Question 9: The slope on the graph does not appear to ever go down. I believe this to be because population of the Anolis lizards are reproducing without signs of stopping which creates more divergences from the common ancestor (more nodes created/ as the slope increases you can see the black line (stairs) get closer and shorter which i believe to be the creation of more species)
#Question 10: Rate Is on line 46
fit.bd(AnolisTree, b, d, rho=0.2)
(b/lambda=0.8031), (d/mu=0),and log(L)=132.9163
