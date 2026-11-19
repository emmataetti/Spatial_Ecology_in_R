# code for developing ecosystem monitoring in different times

#package
library(terra)
library(imageRy)
library(patchwork)

#------------------

# EUROPEAN NITROGEN

# listing data
im.list() 
# there is a file called EN that stands for european nitrogen
# in europe during covid, N02 emissions decrese (less people moving with car)

# import data of euroopean nitrogen
EN01 <- im.import("EN_01.png")

# if the image is flip (mine is not)
# EN01 <- flip(EN01)
# plot(EN01)

# import the final situation image
EN13 <- im.import("EN_13.png")

# so before covid EN01 vs during covid EN13
# there is a huge diff in the two images

# plotting the two situation one on top of the other
# im.ggplot function is for plot a single layer
EN01 # composed by three bands, let's use the first layer and assign this to a plot name

p1 <- im.ggplot(EN01[[1]])
p2 <- im.ggplot(EN13[[1]])
p1/p2

# difference betw situations 01 and 13
# diff betw the first layer of EN01 and the first layer of EN13
diffEN <- EN01[[1]] - EN13[[1]]
diffEN # info on the output
plot(diffEN)

# plotting everything togheter
p3 <- im.ggplot(diffEN)
p1+p2+p3

# time series analysis with several images at a time

# exercise: import directly in stack the NDVI data from 2020
ndvi <- im.import("NDVI_2020")
# using what is common in al the file name, in this way you can import more images all togheter like all of these below are imported
# "Sentinel2_NDVI_2020-02-21.tif"                     
# "Sentinel2_NDVI_2020-05-21.tif"                     
# "Sentinel2_NDVI_2020-08-01.tif"                     
# "Sentinel2_NDVI_2020-11-27.tif"  

# RIDGLINE PLOT (also called joy plot)
# function im.ridegline(name of the image, scale that is the high of vertical line)
im.ridgeline(ndvi, scale=2) # we can remove scale because the default is 2
im.ridgeline(ndvi)

# error so to solve the problem we should givw diff names (ascolta reg)
names(ndvi) <- c ("02_feb", "05_may", "01_aug", "27_nov")

# ridgeline plots
im.ridgeline(ndvi)

# changing the scale parameter inside im.ridgeline()
im.ridgeline(ndvi, scale=1)

# increasing scale 
im.ridgeline(ndvi, scale=10)

# changing the palette
im.ridgeline(ndvi, palette="magma")

# changing the direction of colors
im.ridgeline(ndvi, palette="magma", direction=-1)

#------------------

# ICE MELT IN GREENLAND

# exercise: import the greenland data altogether in a stack

gr <- im.import("greenland")

# exercise: plot only the tenperature of 2000 with the inferno legend from the viridis package
plot(gr[[1]], col=inferno(100))

# plotting the data from 2015
plot(gr[[4]], col=inferno(100))

# difference between 2000 and 2015
dif <- gr[[1]] - gr[[4]]
plot(dif)

# RGB plot with three different layers in time
# on the red = 2000, all of the parts becoming red will have high temperatures in 2000
# on the green = 2005, all of the parts becoming green will have high temperatures in 2005
# on the blue = 2015, all of the parts becoming blue will have high temperatures in 2015

im.plotRGB(gr, 1, 2, 4)



