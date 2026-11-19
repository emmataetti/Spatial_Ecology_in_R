# example code to download external data and upload them to R

# packages
library(terra)

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
