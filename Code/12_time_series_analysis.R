# code for developing ecosystem monitoring in different times

#package
library(terra)
library(imageRy)
library(patchwork)

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
im.ridgeline(ndvi)





