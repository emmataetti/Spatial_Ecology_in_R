# code for graph theory in ecology
# code to develop graph from sp as nodes

# install.packages("igraph") 
library(igraph)

library(igraph)

# run this command at the beginning of each R session to obtain different graph layouts using plot(g)
igraph_options(plot.layout = layout_with_fr)


# example and after you can change the name of the spiecies
# species <- c("Algae", "Zooplankton", "Small Fish", "Large Fish", "Bird")
# predator <- c("Zooplankton", "Small Fish", "Large Fish", "Bird", "Bird")
# prey <- c("Algae", "Zooplankton", "Small Fish", "Small Fish", "Large Fish")

# THE NOODS
# consider a potential food chain where we start from producer, first consumers untill apical consumers
# creatiing a vector containing five species, which will represent the nodes of the food web.
species <- c("Algae", "Zooplankton", "Aphia minuta", "Cyprinus carpio", "Laurus")

# INTERACTIONS
# subset my arrey in two different componennts: prey and predator
predator <- c("Zooplankton", "Aphia minuta", "Cyprinus carpio", "Laurus", "Laurus")
prey <- c("Algae", "Zooplankton", "Aphia minuta", "Aphia minuta", "Cyprinus carpio")

# create a table dataframe with predators and preys inside
interactions <- data.frame(predator, prey)

# bulding the graph
# function that create graph from dataframe
g <- graph_from_data_frame(interactions, vertices=species) # directed=TRUE is the default
plot(g)

# build the graph without directions
g <- graph_from_data_frame(interactions, vertices=species, directed=FALSE) # in this case removed arrows, directed is the default
plot(g)

# the graph will mantain the same interactions but with different rappresentation
# function seed choose only one of the potential rapp

set.seed(42)
g <- graph_from_data_frame(interactions, vertices=species) # directed=TRUE is the default
plot(g)

# the graph maintains the same nodes and interactions, but their spatial arrangement can change
# the set.seed() function makes the random layout reproducible, so the same representation can be obtained again







