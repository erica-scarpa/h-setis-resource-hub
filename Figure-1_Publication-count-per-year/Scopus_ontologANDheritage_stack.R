library(ggplot2)

# Read the datasets from text files
dataset1 <- read.table("Scopus-titleAbstractKeyword-ontologANDCH-Analyze-Year.csv", header = TRUE, sep = ",")
dataset2 <- read.table("Scopus-titleAbstractKeyword-ontologANDheritage-Analyze-Year.csv", header = TRUE, sep = ",")
dataset3 <- read.table("Scopus-titleAbstractKeyword-ontologANDHS-Analyze-Year.csv", header = TRUE, sep = ",")

# Add a new column for dataset name
dataset1$Dataset <- "Ontology and Cultural Heritage"
dataset2$Dataset <- "Ontology and Heritage"
dataset3$Dataset <- "Ontology and Heritage Science"

# Combine the datasets
combined_data <- rbind(dataset1, dataset2, dataset3)

# Create bar chart
ggplot(combined_data, aes(x = factor(YEAR), y = count, fill = Dataset)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Publication Year", y = "Record count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "bottom",
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank()) +
  scale_fill_manual(values = c("Ontology and Cultural Heritage" = "gray87", "Ontology and Heritage" = "gray63", "Ontology and Heritage Science" = "gray10"))
