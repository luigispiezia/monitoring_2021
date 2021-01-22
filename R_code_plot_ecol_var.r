# R code for plotting the relationship among ecological variables
#install packages
install.packages ("sp")
library(sp)

#data is used to recall datasets
data(meuse) #meuse is the dataset already present in sp package

#see the dataset
meuse

View(meuse)

#see only the head of the dataset
head(meuse)

#exercise
#mean of all of the variables.
summary(meuse)
View(summary(meuse))

exercise: plot zinc (y) against cadmium (x)
#error
plot(cadmium,zinc) #so we have to explain to r that cadmium is inside the dataset

#right one, with $
plot(meuse$cadium, meuse$zinc)

attach(meuse)
plot(cadmium, zinc)

plot(cadmium, lead)

#how to impress your supervisor
#scatterplot matrices; funcion pairs()
pairs(meuse)

#pairing only the elements art of the dataset:

##################

#lecture 2 on ecological variablese

#exercise
#recall the package sp, recall dataset meuse

library(sp)
data(meuse)

#scatterplot matrics
pairs(meuse)

#view the very first part of the variables
head(mouse)

#cadmium copper lead zinc
#pairs with soil variables --> seet what are the numbers of column in which this variables are present:
#column 3,4,5,6

pairs(meuse[,3:6])

#let's use the name of the columns 
#column cadmium+copper+lead+zinc alt+5= ~
pairs(~cadmium + copper + lead + zinc, data= meuse)

#let's prettify the graph

#exercise: change the color.
pairs(~cadmium + copper + lead + zinc, data= meuse, col=45)

#for the future change colors of single panel by the par() function

#change simbol to filled triangles
pairs(~cadmium + copper + lead + zinc, data= meuse, col=45, pch=17)

#increase the size of the triangles
pairs(~cadmium + copper + lead + zinc, data= meuse, col=45, pch=17,cex=2)

















