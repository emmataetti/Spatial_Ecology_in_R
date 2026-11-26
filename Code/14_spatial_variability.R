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
# exercise: given the statistical function sd(standard deviation), calculate sd of the NIR with a moving window of 3x3
# sd 3x3
# sd <- focal(sent[[1]], w=3, fun="sd") # avoid this! otherwise you will overwrite the statistical function sd (standard deviation) with the object sd
sdNIR <- focal(sent[[1]], w=3, fun="sd") 
stacksd <- c(sent[[1]], sdNIR)
plot(stacksd, col=cividis(100))
plot(stacksd)

# exercise: calculate sd for :
# 7x7 pixels 
# 13x13 pixels
# and make a stack of all of the data: original, 3x3, 7x7, 13x13
# rename the inner layers of the stack 

sdNIR7 <- focal(sent[[1]], w=7, fun="sd") 
sdNIR13 <- focal(sent[[1]], w=13, fun="sd") 
stacksd <- c(sent[[1]], sdNIR, sdNIR7, sdNIR13)
names(stacksd) <- c("original", "sd_3", "sd_7","sd_13")
stacksd # check if the names are different

plot(stacksd, col=plasma(100))

# measuring the variability of the whole original image (called sent)
# sent <- im.import("sentinel.png")
# with three layers:
# layer 1: NIR
# layer 2: red
# layer 3: green

sentsd <- focal(sent, w=7, fun="sd") # in this case i'm not chossing a single layer
sentsd # the output image has 3 layers
# hypothesis:
# test: plotting the NIRsd vs the sd of the first layer of sent -> sentsd vs sdNIR7

plot(sentsd) 
teststack <- c(sdNIR, sentsd[[1]])
plot(teststack)

# scatterplot
plot(sdNIR7, sentsd[[1]])
cor(sdNIR7, sentsd[[1]])

# pearson correlation (r): values from 0 to 1
# the correlation could be done among vectors (an array of values) not maps, so we use values()
x <- values(sdNIR)
y <- values(sentsd[[1]])
cor(x, y, use="complete.obs")

# since cor=1, the two data are the same!

# loop
sdNIR <- list()

for (w in 1:27) {
  if (w %% 2 == 1 && w > 1) {
    sdNIR[[paste0("w", w)]] <- focal(     
      sent[[1]],
      w = matrix(1, nrow = w, ncol = w),
      fun = "sd"
    )
  }
}

# changing the list to a raster
sdNIR_stack <- rast(sdNIR)
names(sdNIR_stack) <- names(sdNIR)

plot(sdNIR_stack)

