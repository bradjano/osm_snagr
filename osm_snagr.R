# Checking for, downloading, and loading packages

if(!require("tidyverse")) install.packages("tidyverse")
if(!require("osmdata")) install.packages("osmdata")
if(!require("sf")) install.packages("sf")
if(!require("leaflet")) install.packages("leaflet")

library("tidyverse")
library("osmdata")
library("sf")
library("leaflet")


# Now, we'll create our query.

loc <- "Baltimore"

q <- getbb(loc) %>%
  opq() %>% # This function builds the Overpass query to be passed to the API
  add_osm_feature("amenity", "hospital")

d <- osmdata_sf(q)


# Building a map to visually inspect our query results

m <- leaflet(data = d$osm_points) %>%
  addTiles() %>%
  addMarkers(clusterOptions = markerClusterOptions())

m


# Exporting the data for use in a GIS

