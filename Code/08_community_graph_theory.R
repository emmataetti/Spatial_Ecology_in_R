# code for graph theory in ecology
# code to develop graph from sp as nodes

# install.packages("igraph") 
library(igraph)

# example and after you can change the name of the spiecies
# species <- c("Algae", "Zooplankton", "Small Fish", "Large Fish", "Bird")
# predator <- c("Zooplankton", "Small Fish", "Large Fish", "Bird", "Bird")
# prey <- c("Algae", "Zooplankton", "Small Fish", "Small Fish", "Large Fish")

# THE NOODS
# consider a potential food chain where we start from producer, first consumers untill apical consumers
species <- c("Algae", "Zooplankton", "Aphia minuta", "Cyprinus carpio", "Laurus")

# INTERACTIONS
# subset my arrey in two different componennts: prey and predatior
predator <- c("Zooplankton", "Aphia minuta", "Cyprinus carpio", "Laurus", "Laurus")
prey <- c("Algae", "Zooplankton", "Aphia minuta", "Aphia minuta", "Cyprinus carpio")

# create a table dataframe with predators and preys inside
interactions <- data.frame(predatior, prey)

# bulding the graph
# function that create graph from dataframe
g <- graph_from_data_frame(interactions, vertices=species) # directed is the default
plot(g)

# build the graph without directions
g <- graph_from_data_frame(interactions, vertices=species, directed=FALSE) # in this case removed arrows ???
plot(g)

# the graph will mantein the same interactions but with different rappresentation
# function seed choose only one of the potential rapp
set.seed(42)







