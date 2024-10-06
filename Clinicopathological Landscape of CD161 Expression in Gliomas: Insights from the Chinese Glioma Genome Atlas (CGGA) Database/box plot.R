
# Load necessary libraries
library(ggplot2)
data = read.csv("D:/BIOstat/Project/CD161 RNA_sequence analysis/data_process/325and693_1.csv")
# Create boxplot for WHO Grade vs KLRB1
plot1 <- ggplot(data, aes(x = as.factor(Grade), y = KLRB1)) +
  geom_boxplot() +
  labs(x = "WHO Grade", y = "KLRB1 Expression", title = "WHO Grade vs KLRB1") +
  theme_minimal()

# Create boxplot for IDH mutation status vs KLRB1
plot2 <- ggplot(data, aes(x = as.factor(IDH_mutation_status), y = KLRB1)) +
  geom_boxplot() +
  labs(x = "IDH Mutation Status", y = "KLRB1 Expression", title = "IDH Mutation Status vs KLRB1") +
  theme_minimal()

# Create boxplot for C1p19q codeletion status vs KLRB1
plot3 <- ggplot(data, aes(x = as.factor(C1p19q_Codeletion_status), y = KLRB1)) +
  geom_boxplot() +
  labs(x = "C1p19q Codeletion Status", y = "KLRB1 Expression", title = "C1p19q Codeletion Status vs KLRB1") +
  theme_minimal()

# Create boxplot for MGMTp methylation status vs KLRB1
plot4 <- ggplot(data, aes(x = as.factor(MGMTp_methylation_status), y = KLRB1)) +
  geom_boxplot() +
  labs(x = "MGMTp Methylation Status", y = "KLRB1 Expression", title = "MGMTp Methylation Status vs KLRB1") +
  theme_minimal()

# Plot all four boxplots together using gridExtra
library(gridExtra)
grid.arrange(plot1, plot2, plot3, plot4, nrow = 2)

