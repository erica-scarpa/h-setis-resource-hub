# Load required libraries
library(ggplot2)
library(plyr)

# Create the dataset
data <- data.frame(
  labels = c("Ontology", "Ontology", "Ontology", "Ontology", "Ontology", "Thesaurus", "Thesaurus", "Thesaurus", "Thesaurus"),
  parents = c("Active", "Closed", "In Development", "Inactive", "Unknown", "Active", "Closed", "In Development", "Unknown"),
  values = c(29, 11, 13, 12, 8, 15, 59, 9, 37)
)

# Calculate percentages
data <- ddply(data, .(labels), transform, percent = values / sum(values) * 100)

# Create the stacked bar chart

custom_colors <- c(Active = "green3", Closed = "green4", "In Development" = "sienna1", 
                   Inactive = "firebrick2", Unknown = "gray82")

# Create the stacked bar chart
ggplot(data, aes(x = labels, y = percent, fill = parents)) +
  geom_bar(stat = "identity") +
  labs(y = "Percentage", x = "Type", fill = "Status") +
  theme_minimal() +
  theme(legend.position = "right") +
  scale_fill_manual(values = custom_colors)  
