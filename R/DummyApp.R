# load packages
library(shiny)
library(leaflet)
library(leaflet.extras)

# run functions
source("R/Tab1.R")
source("R/Tab2.R")
source("R/generateIdeer.R")
source("R/createPolygon.R")
#generate  app and launch
generateIdeer()
