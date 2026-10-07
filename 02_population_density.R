# R code for pop density


# installing packages
install.packages("spatstat")


# using the package(s)
library(spatstat)

# recall the data
bei

# looking at the points in space
plot (bei)

# changing the shape of points and dimentions
plot(bei, pch=15, cex=.5)

# drivers, anther dataset
bei.extra

#plot  variables
plot

# subsetting a dataset
# there are two diff methods to make the subset:
# first: name of the variable and the simbol $
# second: number of the layer and [] for tables, [[]] for map layers

#first
elevation <- bei.extra$elev
#output
elevation 
#plot
plot(elevation)

# second 
# subset by the number of the layer/variable : in this case no tables but we have map layers
elevation2 <- bei.extra[[1]]


# creating a density map
densitymap <-density(bei)

#plot the result
plot(densitymap)

# plotting points on tops of density map
points(bei, cex=.5)

# multiframe!
#creating multiframe
par(mfrow=c(1, 2))
#plot the two graph in the frame
plot(elevation)
plot(densitymap)

# put elevation map on top of density map
par(mfrow=c(2, 1))
plot(elevation)
plot(densitymap)








 
