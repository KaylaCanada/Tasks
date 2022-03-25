setwd("C:\\Users\\13047\\OneDrive\\Desktop\\Evolution\\Tasks\\")
Data1<-read.csv(file="Malaria Data.csv")
head(Data1)

pdf("rawcases_byregion.pdf", height=4, width=6)
Regions <- unique(Data1$Region)
Cols <- c('#1b9e77','#d95f02','#7570b3','#e7298a','#66a61e')
par(mfrow=c(2,3), mar=c(4,4,4,1), mgp=c(2,0.25,0), tck=-0.01, las=1, cex.axis=0.75)
for (i in 1:length(Regions)){
  Sub <- which(Data1$Region == Regions[i])
  plot(Data1$Year[Sub], Data1$NumCases[Sub], type="b",col=Cols[i], xlab="year", ylab="number of cases", main=Regions[i])
}
plot(Data1$Year, Data1$NumCases, type="n")
for (i in 1:length(Regions)){
  Sub <- which(Data1$Region == Regions[i])
  lines(Data1$Year[Sub], Data1$NumCases[Sub], type="b",col=Cols[i])
}
dev.off()

pdf("logcases_byregion.pdf", height=4, width=6)
Data2 <- Data1
Data2$NumCases <- log(Data1$NumCases)
Cols <- c('#1b9e77','#d95f02','#7570b3','#e7298a','#66a61e')
par(mfrow=c(2,3), mar=c(4,4,4,1), mgp=c(2,0.25,0), tck=-0.01, las=1, cex.axis=0.75)
for (i in 1:length(Regions)){
  Sub <- which(Data2$Region == Regions[i])
  plot(Data2$Year[Sub], Data2$NumCases[Sub], type="b",col=Cols[i], xlab="year", ylab="log number of cases", main=Regions[i])
}
plot(Data2$Year, Data2$NumCases, type="n")
for (i in 1:length(Regions)){
  Sub <- which(Data2$Region == Regions[i])
  lines(Data2$Year[Sub], Data2$NumCases[Sub], type="b",col=Cols[i])
}
dev.off()
