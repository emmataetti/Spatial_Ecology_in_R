# Code to develop spectral indices

library(terra)
library(imageRy)
library(viridis)

# list to see all the images available inside imageRy
im.list()

#  "matogrosso_l5_1992219_lrg.jpg"  name directly from NASA 
# in NASA Earth Observatory you can download images https://science.nasa.gov/earth/earth-observatory/
# if you search the name of the image you can see the information thanks to Wikimedia https://commons.wikimedia.org/wiki/File:Matogrosso_l5_1992219_lrg.jpg

# importing image of Matogrosso in 19992, it's a Landsat5
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# to get info about the image
m1992

#layers of m1992
# layer 1= NIR
# layer 2= red
# layer 3= green

# exercise: put NIR infrared in the green component in im.plotRGB
# make a multiframe with the NIR ontop of the red component and NIR ontop of the green component
im.multiframe(1,2)
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, r=2, g=1, b=3)

# RGB scheme: you can remove r= g= b=
# im.plotRGB(m1992, r=1, g=2, b=3)
# you can also write
# im.plotRGB(m1992, 1, 2, 3)

# add an image: using NIR ontop of blue component
im.multiframe(1,3)
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m1992, r=2, g=3, b=1)

#this was the situation in 1992

# calculating DVI in 1992
# NIR (layer 1)
# red (layer 2)

#DVI=NIR-red
nir1992 <- m1992[[1]]
red1992 <- m1992[[2]]
dvi1992= nir1992-red1992

# we can plot that with different colors
plot(dvi1992, col=rocket(100))
plot(dvi1992, col=inferno(100))
plot(dvi1992, col=mako(100))




