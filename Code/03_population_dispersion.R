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

# looking at the coordinates
coordinates <- geom(rana)

# HOOW TO SUBSET YOUR DATA
# subset the dataset extracting presences
presence <- rana[rana$Occurrence == 1] # important to use the capital letter

# ex: select and assign absences
# method 1
absence <- rana[rana$Occurrence == 0]
# method 2
absence <- rana[rana$Occurrence !=1]

# ex: plot pr and ab with different colors in the same plot
plot(presence, col="blue")
points(absence, col="violet")


