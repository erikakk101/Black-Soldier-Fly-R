# Step 1: Install and load the necessary packages
# You only need to run install.packages() once
# install.packages("ggplot2")
# install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Step 2: Create your data frame
# It's best practice to enter the data directly into a script.
# The 'tibble' is a modern version of a data frame.
df <- tibble(
  Parameter = c("Growth Rate GR%", "Substrate Reduction SR%", "Larval Mortality LM%"),
  T1 = c(0.008, 0.250, 0.470),
  T2 = c(0.0131, 0.370, 0.265),
  T3 = c(0.0209, 0.550, 0.2275),
  T4 = c(0.0232, 0.600, 0.1875)
)

# Step 3: Prepare the data for the "Growth Rate" plot
# We select the first row, convert it to a long format, and calculate the percentage.
growth_rate_data <- df %>%
  filter(Parameter == "Growth Rate GR%") %>%
  select(-Parameter) %>%
  t() %>% # Transpose the data
  as.data.frame() %>%
  mutate(
    Treatment_Labels = c("T1_9mg", "T2_18mg", "T3_27mg", "T4_36mg"),
    GrowthRate_Percent = V1 * 100
  )

# Step 4: Create the plot with ggplot2
growth_plot <- ggplot(growth_rate_data, aes(x = Treatment_Labels, y = GrowthRate_Percent, fill = Treatment_Labels)) +
  geom_bar(stat = "identity", color = "black") +
  # Add the value labels on top of the bars
  geom_text(aes(label = round(GrowthRate_Percent, 2)), vjust = -0.5, size = 4) +
  # Set the titles and axis labels
  labs(
    title = "Growth Rate (GR%) for Different Treatments",
    x = "Treatment",
    y = "Growth Rate (%)",
    fill = "Treatment" # This changes the legend title
  ) +
  # Set the y-axis limit to give space for the labels
  ylim(0, max(growth_rate_data$GrowthRate_Percent) * 1.2) +
  # Apply a clean theme
  theme_minimal(base_size = 14)

# Step 5: Display the plot
print(growth_plot)
