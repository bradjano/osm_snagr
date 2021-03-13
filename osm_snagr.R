library("tidyverse")
library("osmdata")

# First, we need to create a bounding box to select our OSM data.

boxLeft <- 
boxTop <- 
boxRight <- 
boxBottom <- 

myBox <- c()

# Now, we'll create our query.

testQuery <- opq(bbox = myBox) %>%
  add_osm_feature() %>%
  osmdata_sf()