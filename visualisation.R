# Installing the packages needed for plots and data handling
install.packages("ggplot2")
install.packages("dplyr")

# Loading the libraries needed for plotting and data handling
library(ggplot2)
library(dplyr)

# Reading the dataset from the CSV file
df <- read.csv("bestsellers with categories.csv")

# Quick look at the basic statistics in the dataset
summary(df)

# ---------------------------------------------------------
# Scatterplot to check the relationship between reviews and price
# ---------------------------------------------------------
scatter_plot_improved <- ggplot(df, aes(x = Reviews, y = Price)) +
  geom_point(alpha = 0.7, 
             color = "orange", # Changed point color for better visibility
             size = 3) +           # Increased point size from default (usually 1.5)
  geom_smooth(method = "lm", 
              se = TRUE, 
              color = "darkblue", # Changed line color to a professional dark blue
              linewidth = 1.5) +    # Increased line thickness
  labs(
    title = "Scatterplot of Number of Reviews vs Book Price",
    x = "Number of Reviews",
    y = "Price (USD)"
  ) +
  theme_classic() + # Changed theme from minimal to classic for a clean background
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16), # Bigger, centered title
    axis.title = element_text(size = 12),                            # Bigger axis labels
    axis.text = element_text(size = 10)                              # Bigger axis numbers
  )

# Print the improved plot
print(scatter_plot_improved)

# ---------------------------------------------------------
# Histogram to see how review counts are distributed
# ---------------------------------------------------------
hist_plot <- ggplot(df, aes(x = Reviews)) +
  geom_histogram(bins = 30, color = "green") +
  labs(
    title = "Distribution of Reviews",
    x = "Number of Reviews",
    y = "Count"
  ) +
  theme_minimal()

print(hist_plot)

# ---------------------------------------------------------
# Running Pearson correlation test between reviews and price
# ---------------------------------------------------------
cor_test <- cor.test(df$Reviews, df$Price, method = "pearson")

# Showing the test result
print(cor_test)

# ---------------------------------------------------------
# Printing a simple conclusion to appear in the log
# ---------------------------------------------------------
if (cor_test$p.value < 0.05) {
  print("Null hypothesis rejected: There is a significant correlation between book price and number of reviews.")
} else {
  print("Null hypothesis not rejected: There is no significant correlation between book price and number of reviews.")
}

