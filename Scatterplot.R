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
scatter_plot <- ggplot(df, aes(x = Reviews, y = Price)) +
  geom_point(alpha = 0.6) +  # adding points with slight transparency
  geom_smooth(method = "lm", se = TRUE, color = "blue") +  # adding a trend line
  labs(
    title = "Scatterplot of Number of Reviews vs Book Price",
    x = "Number of Reviews",
    y = "Price (USD)"
  ) +
  theme_minimal()

print(scatter_plot)

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

