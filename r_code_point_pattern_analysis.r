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


##### plotting point with different size relate to covid data together with the interpolation.
# use file from outside --> setting working directory

#install and set spatstat
library(spatstat)
library(rgdal)

#remember to set working direcory

#read covid_agg dataset. and check
covid <- read.table("covid_agg.csv", header=TRUE) 

head(covid)
attach(covid) #to consider lat and lot, if you not attach: covid$lon
#interpolate
   #built ppp planar point pattern, stating lon, lat, range for lon and range from lat.
   covid_planar <- ppp (lon, lat,c(-180,180), c(-90,90)) #-180 180 are the maximum coordinate in longitude and 90 is for latitude
   #explaining r that I have the data to do the interpolation
   marks(covid_planar) <- cases #based on column of cases
#built the cases map
cases_map <- Smooth(covid_planar)  #warning message: low amount of point for the cross-validation.

#make a color ramppalette
cl <- colorRampPalette(c('coral1','brown4','purple'))(100)

#plot the map
plot(cases_map,col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add=TRUE)#add=TRUE or T to see both coastlines and plot

####
install.packages("sf")
library(sf)

#take covid data and group the coordinates. (create an array)
Spoints<-st_as_sf(covid,coords=c("lon","lat"))
plot(Spoints, cex=Spoints$cases, col='purple3', lwd=3, add=TRUE)  #plot the point dimension by using as cex the number of cases/100000 because if not the number is too high

#replot
plot(cases_map,col=cl)
plot(Spoints, cex=Spoints$cases/10000, col='purple3', lwd=3, add=TRUE)  #plot the point dimension by using as cex the number of cases/100000 because if not the number is too high
points(covid_planar, pch=19, cex=0.5)
coastlines<- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

##### Leonardo Zabotti data

setwd("/Users/luigispiezia/lab")
leo <- read.table ("dati_zabotti.csv", header=T, sep=",")

head(leo)
#attach dataset since we are going to use coordinates
attach(leo)

library(spatstat)

#find minimum and maximum x and y
summary(leo)

leo_planar <- ppp (lon, lat,c(-,180), c(-90,90)) 




