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

# plot stats
ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
 geom_bar(stat="identity", fill="white")
# aes is the aesthetic
# geom_bar() ??

# exercise: do the same for 2006
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")








library(ggplot2)
library(patchwork) 






# Using the ggplot2 package for the final graph
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
      geom_bar(stat="identity", fill="white") +
      ylim(c(0,100)) +
      theme(legend.position = "none")

# Exercise: make the same plot for 2006
p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
      geom_bar(stat="identity", fill="white") +
      ylim(c(0,100))

p1 + p2
p1 / p2
