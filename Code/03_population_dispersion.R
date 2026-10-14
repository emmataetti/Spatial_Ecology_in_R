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
plot(presence, col="blue", cex=2.5)
points(absence, col="violet", cex=2.5)

# DRIVERS

# ELEVATION
# load the path to elevation file
elev <- system.file("external/elevation.asc", package="sdm")
# ex: using the rast() function import data
elevmap <- rast(elev)
# we can plot the map
plot(elevmap)
#change the color of the map
cl <- colorRampPalette(c("dark blue","green","light blue"))(100)
# plot with the new colors
plot(elevmap, col=cl)
#plotting pr vs elevation
cl <- colorRampPalette(c("red","orange","yellow"))(100)
plot(elevmap, col=cl)
# on top of this map add pr
points(presence, cex=2)

#TEMPERATURE
# import and plot temperature with cl ramp palette
temp <- system.file("external/temperature.asc", package="sdm")
tempmap <- rast(temp)
plot(tempmap)
cl <- colorRampPalette(c("red","orange","yellow"))(100)
plot(tempmap, col=cl)
points(presence, cex=2)

# PRECIPITATION
# do the same for precipitation
prep <- system.file("external/precipitation.asc", package="sdm")
prepmap <- rast(prep)
plot(prepmap)
cl <- colorRampPalette(c("red","orange","yellow"))(100)
plot(prepmap, col=cl)
points(presence, cex=2)

# VEGETATION
vege <- system.file("external/vegetation.asc", package="sdm")
vegemap <- rast(vege)
plot(vegemap)
cl <- colorRampPalette(c("red","orange","yellow"))(100)
plot(vegemap, col=cl)
points(presence, cex=2)


# plotting elevmap with viridis package
plot(elevmap, col=viridis(100))
plot(elevmap, col=mako(100))

#plot the maps all togheter in the same multiframe
par(mfrow=c(2,2))
plot(elevmap, col=viridis(100))
plot(tempmap, col=viridis(100))
plot(prepmap, col=viridis(100))
plot(vegemap, col=viridis(100))

# put a title to the maps, using the argument main
par(mfrow=c(2,2))
plot(elevmap, col=viridis(100), main="elevation")
plot(tempmap, col=viridis(100), main="temperature")
plot(prepmap, col=viridis(100), main="precipitation")
plot(vegemap, col=viridis(100), main="vegetation")

# making a stack
drivers <- c(elevmap, tempmap, prepmap, vegemap)
plot(drivers, col=inferno(100))

# how to plot a singe driver from the stack, two methods:
# first: you can subset the stack using the level
t <- drivers [[2]]
plot(t)
points(presence)
# second: use the name
t <- drivers$temperature
plot(t)
points(presence)
