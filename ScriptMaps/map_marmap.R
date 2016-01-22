###############################################################
#  Map data with maps library / high-res rworldxtra libraries
#  MC FONTAINE
###############################################################

#setwd("~/Desktop/maps/")  # Define a specific path where you want to work
data <- read.table(file="MildiouEuro.txt", header=TRUE) # Import data, tab-delimited with a header
attach(data)  #use the variable names. if you don't do this, you will need to used the notation data$Lat

library(marmap)
# https://epante.wordpress.com/marmap/
# http://www.molecularecologist.com/2015/07/marmap/

#define the geographic range of the map
exLong <- 5
xlim <- c(min(Long)-exLong,max(Long)+exLong)
ylim <- c(min(Lat)-exLong,max(Lat)+exLong)

europe <- getNOAA.bathy(lon1=xlim[1], lon2=xlim[2], lat1 = ylim[1], lat2 = ylim[2], resolution=4)

# Creating color palettes
# Create nice looking color palettes
blues <- c("lightsteelblue4", "lightsteelblue3", "lightsteelblue2", "lightsteelblue1")
greys <- c(grey(0.6), grey(0.93), grey(0.99))

plot(europe, image = TRUE, land = TRUE, lwd = 0.1, bpal = list(c(0, max(europe), greys), c(min(europe), 0, blues)),xlim=xlim, ylim=ylim)

# Add coastline
plot(europe, n = 1, lwd = 0.1, add = TRUE)
points(Long , Lat, pch = 21, col = "black",bg = "yellow", cex = 1.3)
#export pdf
dev.copy2pdf(file="map_marmap.pdf")

