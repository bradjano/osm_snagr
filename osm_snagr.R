# Checking for, downloading, and loading packages

if(!require("tidyverse")) install.packages("tidyverse")
if(!require("osmdata")) install.packages("osmdata")
if(!require("sf")) install.packages("sf")
if(!require("ggmap")) install.packages("ggmap")
if(!require("leaflet")) install.packages("leaflet")

library("tidyverse")
library("osmdata")
library("sf")
library("ggmap")
library("leaflet")


# Now, we'll create our query.

loc <- "Baltimore"

q <- getbb(loc) %>%
  opq() %>% # This function builds the Overpass query to be passed to the API
  add_osm_feature("amenity", "hospital")

d <- osmdata_sf(q)


# Building a map to visually inspect our query results

bmap <- get_map(getbb(loc), maptype = "toner-background")

# ggmap(bmap) +
#   geom_sf(data = d$osm_points,
#     inherit.aes = FALSE,
#     colour = "#238443",
#     fill = "#004529",
#     alpha = .5,
#     size = 4,
#     shape = 21
#   ) +
#   labs(x = "", y = "")

m <- leaflet(data = d$osm_points) %>%
  addTiles() %>%
  addMarkers()

m

# Exporting the data for use in a GIS

