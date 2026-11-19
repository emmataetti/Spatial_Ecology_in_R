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

# Zenodo link to the data taken by drones (18/11):
# https://zenodo.org/records/24343819

# import several images all togheter

# single images that i want to import:
# DJI_20261118105853_0005_MS_G  green band
# DJI_20261118105853_0005_MS_NIR  NIR band
# DJI_20261118105853_0005_MS_R  red band

# to import them all togheter
# terra is not allowing to import several data using the common part of the name (vs imageRy)

# so we list the file
files <- list.files(path="C:/Users/emmat/Downloads",
          pattern="DJI_20261118105853_0005", 
          full.names=TRUE)

bologna <- rast(files)
plot(bologna[[2]], col=magma(100))

im.plotRGB(bologna, 1, 2, 3)


# is that possible to enter data directly from GitHub or zenodo? yes!

# uploading data from GitHub
# link to the data: link of the web page/name of the photo that we want to import
# https://github.com/ducciorocchini/Spatial_Ecology_in_R_2026/tree/main/Data/group_photo/DJI_20261118105938_0002_D.JPG
# put the link on chatgpt and ask the real link to get data from GitHub
# use this link:
# https://github.com/ducciorocchini/Spatial_Ecology_in_R_2026/raw/refs/heads/main/Data/group_photo/DJI_20261118105938_0002_D.JPG

groupphoto <- rast("https://github.com/ducciorocchini/Spatial_Ecology_in_R_2026/raw/refs/heads/main/Data/group_photo/DJI_20261118105938_0002_D.JPG") 
plot(groupphoto)

# we can do the same for zenodo
# link to the page: https://zenodo.org/records/15730101
# name of the image:  d59dfee7-17e7-4e50-9e17-f812ee3c5584.jpeg
# https://zenodo.org/records/15730101/d59dfee7-17e7-4e50-9e17-f812ee3c5584.jpeg
# new link from chatgpt (it added "/file/" between the link and the name):
# https://zenodo.org/records/15730101/files/d59dfee7-17e7-4e50-9e17-f812ee3c5584.jpeg

sella <- rast("https://zenodo.org/records/15730101/files/d59dfee7-17e7-4e50-9e17-f812ee3c5584.jpeg")
plot(sella)
