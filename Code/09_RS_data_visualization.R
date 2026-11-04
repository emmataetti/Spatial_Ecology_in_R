# Code to visualize remote sensing data

# numbers associated with different bands: https://custom-scripts.sentinel-hub.com/custom-scripts/sentinel-2/bands/
#b2:blue, b3:green, b4:red, b8:near infrared

# Zenodo set: https://zenodo.org/records/15645465
# library(remotes)
# install_github("ducciorocchini/imageRy")

library(imageRy)
library(terra)
library(viridis)

# listing data inside imageRy
im.list()

# BLUE b2
# importing the first band
b2 <- im.import("sentinel.dolomites.b2.tif")
plot(b2)

# change the palette thanks to viridis package
plot(b2, col=inferno(100))  # reflecting: yellow /absorb:black

# GREEN b3
# exercise: import the green band of sentinel and plot it with the mako legend
b3 <- im.import("sentinel.dolomites.b3.tif")
plot(b3)
plot(b3, col=mako(100))  # reflecting:light blue/absorbing:black

# make a multiframe with the function im.multiframe
im.multiframe(1,2)
plot(b2, col=inferno(100))
plot(b3, col=mako(100))

# exercise: plot the two bands one on top of the other
im.multiframe(2,1)
plot(b2, col=inferno(100))
plot(b3, col=mako(100))

# now we can import all of the other bands

# RED b4
#import the red band (band number 4)
b4 <- im.import("sentinel.dolomites.b4.tif")
plot(b4, col=cividis(100)) # plot it wuith another legend of viridis

# NEAR INFRARED b8
#import the near infrared
b8 <- im.import("sentinel.dolomites.b8.tif")
plot(b8, col=viridis(100)) 




# the multiframe from the CRAN is not properly working, so use the GitHub version:
duccio <- function(x,y){
   par(mfrow=c(x,y))
   }

dev.off()
plot(b2,b3)

# Exercise: import band 4
b4 <- im.import("sentinel.dolomites.b4.tif")
plot(b4)
plot(b4, col=cl)

# import band 8
b8 <- im.import("sentinel.dolomites.b8.tif")
plot(b8)

im.multiframe(1,2)
plot(b4)
plot(b8)

# build your own function for plotting
duccio <- function(x,y){
  par(mfrow=c(x,y))
  }

# Exercise: with the function duccio, build a multiframe of 2 rows and 2 columns and plot all the imported data
duccio(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# Exercise: create a multiframe with 1 row and 2 columns, plot one against the other 
# b2 b3
# b2 b8

duccio(1,2)
plot(b2,b3)
plot(b2,b8)

# creating colored images
sent <- c(b2, b3, b4, b8)

# layer 1 = original (from Sentinel-2) b2 = blue
# layer 2 = original (from Sentinel-2) b3 = green
# layer 3 = original (from Sentinel-2) b4 = red
# layer 4 = original (from Sentinel-2) b8 = NIR

# natural color image
im.plotRGB(sent, r=3, g=2, b=1, title='natural color')

# false color image
im.plotRGB(sent, r=4, g=3, b=2, title='false color')
im.plotRGB(sent, r=3, g=4, b=2, title='false color')
im.plotRGB(sent, r=3, g=2, b=4, title='false color')

duccio(2,2)
im.plotRGB(sent, r=3, g=2, b=1, title='natural color')
im.plotRGB(sent, r=4, g=3, b=2, title='false color')
im.plotRGB(sent, r=3, g=4, b=2, title='false color')
im.plotRGB(sent, r=3, g=2, b=4, title='false color')


im.plotRGB(x, r, g, b, title = "")
