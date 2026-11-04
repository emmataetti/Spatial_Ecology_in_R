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

# multiframe with all the bands
# exercise: build a 4x4 multiframe and plot all of the bands with the default palette (viridis)
im.multiframe(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# insted of using default palette, we can also use colorRamp Palette

# for b2 - blue band
clb <- colorRampPalette(c("blue4", "blue1", "cadetblue1")) (100)
plot(b2, col=clb) # reflecting: light blue

# exercise: do the same for b3 - green band
clg <- colorRampPalette(c("darkolivegreen", "darkolivegreen1", "darkolivegreen3")) (100)
plot(b3, col=clg) # reflecting: light green

# for b4 - red band
clr <- colorRampPalette(c("firebrick", "firebrick2", "firebrick3")) (100)
plot(b4, col=clr) # reflecting: light red

# for b8 - NIR band
cln <- colorRampPalette(c("magenta", "green", "yellow")) (100)
plot(b8, col=cln) # absorbing: magenta/ reflecting: green to yellow part

# exercise: create a stack of all the bands togheter with a new obj sent considering the bands as a elements of an array
sent <- c(b2, b3, b4, b8)
plot(sent)
plot(sent, col=magma(100))

# to get information about a band
b8 # information about the single band
sent # informazion about all the bands

#now everithing which is assorbing is barck and everything whichiis reflection is light
# you can reverse the color and you obtain the opposite
plot(sent, col=magma(100, direction=-1)) # absorbing: light colors

# stack by the imageRy package: in this case i put part of the name that is common between all the files 
sentinel <- im.import("sentinel.dolomites") # intead of import all single band as we did before using all the name of the file for each band "sentinel.dolomites.b4.tif"
plot(sent, col=mako(100))

# exercise: starting from the stack called sentinel plot only NIR band
# original b2 = layer 1 in the stack
# original b3 = layer 2 in the stack
# original b4 = layer 3 in the stack
# original b8 = layer 4 in the stack
# since the stack was built by:sent <- c(b2, b3, b4, b8)

# subset the stack 
plot(sentinel[[4]])

# RGB: plots all togheter several images 


