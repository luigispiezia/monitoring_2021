#point pattern analysis
install.packages("spatstat")
install.packages("rgdal")
library(rgdal)
library(spatstat)

#now let's see the thensity of the covid data

########## IMPORT DATA FROM AN EXTERNAL SOURCE
#to know the current working directory
getwd()

#create a folder under the main disk
#set the working directory
setwd("/Users/luigispiezia/lab")
covid<- read.table("covid_agg.csv", header=TRUE)

#read the first 6 rows datas
head(covid)

#have information of the statistics
summary(covid)

#just know which are the variables
names(covid)

#let's see the density of the covid data
#let's make a planar point pattern in spatstat

#attach covid data
attach(covid) 
#x,y,ranges
names(covid)
covid_planar <- ppp (lon, lat,c(-180,180), c(-90,90)) #-180 180 are the maximum coordinate in longitude and 90 is for latitude

#density
density_map <- density(covid_planar)
#plot the datas
plot(density_map)

#add point
points(covid_planar)

#change colors
cl <- colorRampPalette(c('yellow','orange','red'))(100)
plot(density_map, col=cl)
points(covid_planar)

#put countries on the map
#reading the file of the coastline
coastlines<- readOGR("ne_10m_coastline.shp")

#replot density map with coastline
cl <- colorRampPalette(c('orange','red','purple'))(100)
plot(density_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)#add=TRUE to see both coastlines and plot

#make a png image
png("figure1.png")
#replot density map with coastline
cl <- colorRampPalette(c('orange','red','purple'))(100)
plot(density_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)#add=TRUE to see both coastlines and plot
dev.off() #t turn off th terminal.

########interpolate
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
#replot
plot(cases_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)#add=TRUE or T to see both coastlines and plot


 




















