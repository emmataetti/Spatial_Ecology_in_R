# code to estimate spatial variability of images

library(terra)
library(imageRy)
library(viridis)

# listing the different avaialable sets in imageRy
im.list()
# in th list there is one called "sentinel.png", we want to import that
#importing the data
sent <- im.import("sentinel.png")

# layer 1: NIR
# layer 2: red
# layer 3: green

# imageRy::im.plotRGB () -> :: means a function related to that specific package
# exercise: plot in RGB the image putting NIR ontop of green component
im.plotRGB(sent, 2, 1, 3) 

# terra::plotRGB ()
# ex: make the same plot with the plotRGB function from terra
?plotRGB # to get info about the function
plotRGB(sent, 2, 1, 3, stretch="lin")

# measuring the mean: univariate statistics
# focal function
meanNIR<- focal(sent[[1]], w=3, fun="mean")
plot(meanNIR)

# plot the original NIR band beside the meanNIR
im.multiframe(1,2)
plot(sent[[1]])
plot(meanNIR)

# another way to do that
stackNIR <- c(sent[[1]], meanNIR)
plot(stackNIR)

# ex: calculate the mean of NIR with a moving window of 7x7 pixels
meanNIR7 <- focal(sent[[1]], w=7, fun="mean")

# ex: plot the images all togheter making a stack
stackNIR <- c(sent[[1]], meanNIR, meanNIR7)
plot(stackNIR)

# exercise: make the 13x13 mean, put in the stack and plot the stack with the inferno legend
meanNIR13 <- focal(sent[[1]], w=13, fun="mean")
stackNIR <- c(sent[[1]], meanNIR, meanNIR7, meanNIR13)
# inferno is inside the viridis package
# library(viridis)
plot(stackNIR, col=inferno(100))

stackNIR # several images with the same names
# names: sentinel_1, focal_mean, focal_mean, focal_mean
# change the names to the stack
names(stackNIR) <- c("original", "mean_3", "mean_7","mean_13")
stackNIR # we can see the new names
plot(stackNIR, col=mako(100))

# plotting to sets in scatterplot
plot(stackNIR[[2]], stackNIR[[4]])
# add the line of the relationship of 1:1 between mean_13 and mean_3
abline(0,1, col="red") # y=x

# how to measure variability
# ex: given the statistical function sd(standard deviation), calculate sd of the NIR with a moving window of 3x3
# sd 3x3
# sd <- focal(sent[[1]], w=13, fun="sd") # avoid this! otherwise you will overwrite the statistical function sd (standard deviation) with the object sd
sdNIR <- focal(sent[[1]], w=13, fun="sd") 
stacksd <- c(sent[[1]], sdNIR)
plot(stacksd, col=viridis(100))




