setwd('C:\\Users\\Kayla\\OneDrive\\Desktop\\Evolution\\Tasks\\')
x<-rnorm(100, mean=5, sd=4)
var(x)
mean(x)
y<-((x*5)+2)+runif(100,0,0.1)
pdf('plot1.pdf', height=4, width=4)
plot(x,y)
abline(lm(y~x), col='red')
dev.off()
coef(lm(y~x))
#The y-intercept is 2.045176 abd the x-intercept is 5.000112
z<-c()
x<-rnorm(100, mean=5, sd=4)
for (i in 1:100) {
  z[i] <-runif(1)
  y<-(x*z[i]) + 2 + (rnorm(100, 0:0.1))
  l<-coef(lm(z[1:100]~y))
}
pdf('plot2.pdf', height=4, width=4)
plot(z[1:100], y)
abline(lm(y~z[1:100]))
dev.off()
coef(lm(y~z))
pdf('plot3.pdf', height=4, width=4)
plot(c(z, -2.445))
dev.off()
#
#install.packages("ggplot2")
library(ggplot2)
iter<-10000
doors<-c("goat", "goat", "car")
monty_hall<-function(iteration){
  contestant_door<- sample(doors, size=iteration, replace=TRUE)
  i=1:iteration
  stick_win<-ifelse(contestant_door == 'car',1,0)
  switch_win<-ifelse(contestant_door == 'car', 0,1)
  stick_prob<-cumsum(stick_win)/i
  switch_prob<-cumsum(switch_win)/i
  results<-data.frame(i=i, contestant_door=contestant_door,
                      stick_win=stick_win, switch_win=switch_win,
                      stick_prob=stick_prob, switch_prob=switch_prob)
  return(results)
}
monty_hall_results<-monty_hall(iter)
summary<-table(monty_hall_results$contestant_door)
df_summary<- data.frame(label = names(summary), count=matrix(summary))
print(df_summary)
head(monty_hall_results)
plotTheme()
#install.packages("tweenr")
library(tweenr)
plotTheme()
#install.packages('meme')
library(meme)
pic<-"C:\\Users\\13047\\Downloads\\Evolution\\Screenshot 2022-04-25 102843.png"

png("meme.png", height=8, width=8)
if(.Platform$OS.type == "windows") {
  windowsFonts(
    Impact = windowsFont("Impact"),
    Courier= windowsFont("Courier"))
}
library(meme)
u<-system.file("angry8.jpg", package="meme")
meme(u, "I Said", "It Is A SALAMANDER!")
dev.off()

meme_save

