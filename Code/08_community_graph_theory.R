# code for graph theory in ecology
# code to develop graph from sp as nodes

# install.packages("igraph") 
library(igraph)

# consider a potential food chain where we start from producer, first consumers untill apical consumers
species <- c("Algae", "Zooplankton", "Aphia minuta", "Cyprinus carpio", "Laurus")

# subset my arrey in two different componennts: prey and predatior
predator <- c("Zooplankton", "Aphia minuta", "Cyprinus carpio", "Laurus", "Laurus")
prey <- c("Algae", "Zooplankton", "Aphia minuta", "Aphia minuta", "Cyprinus carpio")

# create a table dataframe with predators and preys inside
interactions <- data.frame(predatior, prey)

# bulding the graph
# function that create graph from dataframe
graph_from_data_frame(interactions, vertices=species)
