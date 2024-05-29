library(waffle)   
library(readxl)
library(ggplot2)

# Load the dataset from the first sheet of the Excel file
data <- read_excel("waffle_countries.xlsx", 1)

# Define a color palette with 16 colors
color_palette <- c(
  "#4169E1", "lightblue", "#FFA500", "#FF1493", "#DAA520", "cornsilk1", "#32CD32",
  "#DC143C", "#dd99ff", "#ffc0cb", "#FF6347", "#e6e600", "#008B8B", "#9932CC",
  "#444444", "darkgrey","#000000"
)

# Plot the waffle chart
ggplot(
  data,
  aes(values=Count, fill=Country_end) # Use 'Status' if using the dataset from the second sheet of Excel
) +
  waffle::geom_waffle(
    n_rows = 10,        
    color = "white",   
    flip = TRUE, na.rm=TRUE
  ) +
  facet_wrap(~ Country_start, nrow = 4, ncol = 4) + 
  scale_fill_manual(values = color_palette) +
  coord_equal()