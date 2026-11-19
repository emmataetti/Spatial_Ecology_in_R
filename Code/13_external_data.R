# example code to download external data and upload them to R

# packages
library(terra)
library(imageRy)
library(viridis)

# linux
setwd("~/Downloads")

# Mac
setwd("/Users/ducciorocchini/Downloads")
# Mac users can also make use of the tilde ~
setwd("~\Downloads")

# Windows: \ in the path, the correct one is the slash! /
setwd("C://....../Downloads")

# check your working directory
getwd()

# importing the image
ozone <- rast("ozone_geos5_20260918_hires.jpg")
ozone

# plot the image
ozone <- flip(ozone)
plotRGB(ozone, 1, 2, 3, stretch="lin")
plotRGB(ozone, 1, 3, 2, stretch="lin")
plotRGB(ozone, 3, 1, 2, stretch="lin")

# Zenodo link to the data taken by drones (18/11):
# https://zenodo.org/records/24343819

# donwload the photo, search for my foto in donwload, look at the proprietà
# C:\Users\emmat\Downloads
# change backslash in /
setwd("C:/Users/emmat/Downloads")

# group photo
# name of the image: DJI_20261118105938_0002_D.JPG
gp <- rast("DJI_20261118105938_0002_D.JPG")

# plot the RGB image
plot(gp)

# plot changing the RGB scheme
plotRGB(gp, 2, 3, 1, stretch="lin")

# import another image: DJI_20261118105938_0002_F.JPG
# group foto NDVI
gpndvi <- rast("DJI_20261118105938_0002_F.JPG") # this is not exatly NDVI but a sketch in RGB of NDVI
plot(gpndvi)

# plot the two photo togheter
im.multiframe(1,2)
plot(gp)
plot(gpndvi)
plotRGB(gpndvi, 2, 3, 1, stretch="lin")

# plotting just the first layer to avoid the rainbow color
plot(gpndvi[[1]])

# plotting the 3 single layer
im.multiframe (2,2)
plot(gpndvi[[1]])
plot(gpndvi[[2]])
plot(gpndvi[[3]])

# using viridis package


