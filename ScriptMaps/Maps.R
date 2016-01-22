###############################################################
#  Map data with maps library / high-res rworldxtra libraries
#  MC FONTAINE
###############################################################

#setwd("~/Desktop/maps/")  # Define a specific path where you want to work
data <- read.table(file="MildiouEuro.txt", header=TRUE) # Import data, tab-delimited with a header
#head(data$Lat)

attach(data)  #use the variable names. if you don't do this, you will need to used the notation data$Lat

#You you may need those libraries
# library(fields) # can be usefull for interpolated surfaces
library(maps)
library(mapdata)
library('rworldxtra') #Updated highres maps (http://www.naturalearthdata.com/downloads/10m-cultural-vectors/)
data(countriesHigh)

#define the geographic range of the map
exLong <- 5
xlim <- c(min(Long)-exLong,max(Long)+exLong)
ylim <- c(min(Lat)-exLong,max(Lat)+exLong)

# Plot the map
#map('world', fill=TRUE,col="grey90", xlim=xlim, ylim=ylim)
map('world', fill=TRUE,col="grey90")
#plot(countriesHigh, fill=TRUE,col="grey90", xlim=xlim, ylim=ylim) # for high resolution
points(Long , Lat, pch=16, col="red")
map.axes(xlab="Long", ylab="Lat")
dev.copy2pdf(file="map.pdf")
