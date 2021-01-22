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
