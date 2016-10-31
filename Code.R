install.packages("ggmap")
install.packages("mapproj")
library(ggmap)
library(mapproj)
library(ggplot2)

sf <- get_map(location = "san francisco", maptype="roadmap", zoom = 12)
ggmap(sf)
data = read.csv("incident.csv")
vt = subset(data, data[[2]] == "VEHICLE THEFT", drop = TRUE)
ggmap(sf, extent = "device") + geom_density2d(data = vt, 
      aes(x = X, y = Y), size = 0.3) + stat_density2d(data = vt, 
      aes(x = X, y = Y, fill = ..level.., alpha = ..level..), size = 0.01, 
      bins = 16, geom = "polygon") + scale_fill_gradient(low = "green", high = "red", 
      guide = FALSE) + scale_alpha(range = c(0, 0.3), guide = FALSE)
