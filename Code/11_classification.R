# R code to classify the images thanks to k-means
# link: https://github.com/ducciorocchini/Spatial_Ecology_in_R_2026/blob/main/kmeans.md

#packages
library(terra)
library(imageRy)

# install.packages("ggplot2")
# install.packages("patchwork")


#list of the data
im.list()

# exercise: import solar orbiter image and assign it to the obj called sun
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
# three main levels of gass energy: yellow(high energy)/brown(medium energy)/dark brown(low energy) so 3 classies

# classifying the data
?im.classify # for the explenation
sunclass <- im.classify(sun, num_clusters=3)

# seed an argument that concent to use only one aiteration
sunclass <- im.classify(sun, num_clusters=3, seed=42) # to obtail always the same colors instead of changing every time

# importing data of matogrosso
# exercise: import data of matogroosso and give them the names of m1992 and m2006
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# plot them in a multiframe
> im.multiframe(1,2)
> plot(m1992)
> plot(m2006)

# if the images are flipped upside down (in my case they are in the correct orientation)
# flip() is the function to put the images north oriented
# m1992 <- flip(m1992)
# m2006 <- flip(m2006)

# classifying the m1992 image into forest and human (two classes so two clusters)
 m1992class <- im.classify(m1992, num_clusters=2)
# class 1: forest
# class 2: human 
# in my case the colors can be the opssosite for someonelese

# classifying the m2006 image into forest and human
 m2006class <- im.classify(m2006, num_clusters=2)
# class 1: human
# class 2: forest 
# in my case

# frequencies of pixels attaining to the classes of m1992class
# function freq() that calculates the frequencies of data
f1992 <- freq(m1992class)

# calculate proportion: freq/tot
#calculate the total : the function ncell() that calculate tehe total number of cells
tot1992 <- ncell(m1992class)
# exercise: calculate the proportion of the two classes
prop1992= f1992 / tot1992 # since this is a matemathical operation i can put = intead of <-

# calculating percentages
perc1992 = prop1992*100
perc1992
# forest:83%
# human:17%

# freq of m2006
f2006 <- freq(m2006class)
# total of m2006
tot2006 <- ncell(m2006class)
# proportion of the two classes 
prop2006= f2006 / tot2006
# percentage of m2006
perc2006 = prop2006*100
perc2006
# human : 55%
# forest : 45%

#creating a dataframe
class <- c("Forest", "Human")
perc1992 <- c(83,17)
perc2006 <- c (55,45)
tabout <- data.frame (class, perc1992, perc2006)

# we are going to use another package
library(ggplot2)

# plot stats
ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_bar(stat="identity", fill="white")
# aes is the aesthetic: describe the composition of the graph
# geom_bar() describe how to do the bar (ex fill is the color inside the bar)

# exercise: do the same for 2006
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")

# changing the fill color 
ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_bar(stat="identity", fill="yellow")

# changing the geometry
# add point instead of bar using another funcion geom_point()
ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_point()

# so we have two ggplots of 1992 and 2006 
# 1992
ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_bar(stat="identity", fill="white")
# 2006
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")

# we are going to use another package
library(patchwork) 
# using this package to plot several plots togheter
# assign the plots to obj
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_bar(stat="identity", fill="white")
p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")
p1+p2

# exercise: with patchwork put one plot on top the other
p1/p2

# NB with ggplot you can not the multriframe function!

# p1+p2 the plot at sx and the plot a dx have a different scale so bias
# to solve the issue: function that change the scale of data called ylim

p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_bar(stat="identity", fill="white") +
 ylim(0,100) # range inside () in  this case we are dealing with % so from 00 to 100

p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(0,100)

p1+p2

# removing one legend
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_bar(stat="identity", fill="white") +
 ylim(0,100) +
 theme(legend.position="none")

p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white") +
  ylim(0,100)

p1+p2

#using patchwork with satellite date
im.ggplot(m1992[[1]])
im.ggplot(m2006[[1]])

# plotting satellite data and stat togheter
s1 <- im.ggplot(m1992[[1]])
s2 <- im.ggplot(m2006[[1]])

# final plot
(s1 | s2) /
(p1 | p2) 

# doing the same with RGB images
rgb1 <- im.ggplotRGB(m1992)
rgb2 <- im.ggplotRGB(m2006)

# final plot
(rgb1 | rgb2) /
(p1 | p2)






