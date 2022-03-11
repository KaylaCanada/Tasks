install.packages("auk")
setwd("C:\\Users\\13047\\AppData\\Local\\Temp\\Rtmpwi2I03\\downloaded_packages")
library(auk)
states<-c("US-NY", "CR-P")
system.file("extdata/ebd-sample.txt",package="auk") %>%
  auk_ebd() %>%
  auk_state(states)
ebd<-auk_ebd(system.file("extdata/ebd-smaple.txt", package="auk"))
system.file("extdata/ebd-sample.txt", package="auk")%>%
 auk_ebd()%>%

f<-system.file("extdata/ebd-sample.txt", package="auk")
ebd<-auk_ebd(f)%>%
auk_species(species="Blue Jay", ) %>%
  auk_country(country="United States") %>%
  auk_state(state="New York") %>%
  auk_filter(file = output_file) %>%
  read_ebd()