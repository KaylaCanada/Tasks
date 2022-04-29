#Data1<-read.csv(file="C:\\Users\\13047\\Downloads\\Evolution\\Tortoise Data.csv")
#print(csv_data)
Data1<-read.csv(file="C:\\Users\\13047\\Downloads\\Evolution\\Tortoise Data.csv")
par(las=1, mgp=c(2.5, 0.25, 0), tck=-0.005)
plot(x=Data1$Average.Weight, y=Data1$Average.Length, xlab="Average Weight", ylab="Average Length", main="Correlation Between Average Weight and Average Length", log="xy")
install.packages('treebase')
library(treebase)
testudines<-search_treebase("testudines")
  library(phytools)
  library(ape)
text.string<-"((((((Podocneminae, Pelomedusinae)), (Chelidae-long-necked, Chelidae-short-necked)), (Emydidae,(Geoemydidae,Testudinidae)), (Kinosternidae, Trionychidae)), Platysternidae), Chelydridae), Chelonioidea);"
vert.tree<-read.tree(text=text.string)
plot(vert.tree, edge.width=2)
y<-Data1$Average.Length
x<-Data1$Average.Weight
cor(x,y, method="pearson")
res<-cor.test(x,y,method="pearson")
