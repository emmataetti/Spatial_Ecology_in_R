# script for modelling the dispersion of population of individuals

# new packages to be installed:
#install.packages("terra")
#install.packages("sdm")

# check/use the pakages 
library(terra)
library(sdm)

# path to the file
path <- system.file("external/species.shp", package="sdm")

# import the vector data
rana <- vect(path)

# plot the data
plot(rana)
