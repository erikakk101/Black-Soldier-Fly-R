import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Step 1: Create your data in a dictionary
data = {
    'Growth Parameters': ["Growth Rate GR%", "Substrate Reduction SR%", "Larval Mortality LM%"],
    'T1': [0.008, 0.250, 0.470],
    'T2': [0.0131, 0.370, 0.265],
    'T3': [0.0209, 0.550, 0.2275],
    'T4': [0.0232, 0.600, 0.1875]
}

# Step 2: Convert the dictionary to a pandas DataFrame
df = pd.DataFrame(data)
df.set_index('Growth Parameters', inplace=True) # Set parameters as the row index

# Step 3: Prepare the data for the "Growth Rate" plot
# We select the 'Growth Rate GR%' row, multiply by 100, and create a new DataFrame for plotting.
growth_rate_series = df.loc['Growth Rate GR%'] * 100
plot_data = pd.DataFrame({
    'Treatment': ['T1_9mg', 'T2_18mg', 'T3_27mg', 'T4_36mg'],
    'Value': growth_rate_series.values
})

# Step 4: Create the plot using seaborn and matplotlib
plt.figure(figsize=(10, 6)) # Set the figure size

# Create the bar plot
barplot = sns.barplot(x='Treatment', y='Value', data=plot_data, hue='Treatment', palette='viridis', dodge=False)

# Add the value labels on top of each bar
for index, row in plot_data.iterrows():
    barplot.text(index, row.Value + 0.05, round(row.Value, 2), color='black', ha="center", fontsize=12)

# Step 5: Customize the plot
plt.title('Growth Rate (GR%) for Different Treatments', fontsize=16)
plt.xlabel('Treatment', fontsize=12)
plt.ylabel('Growth Rate (%)', fontsize=12)
plt.ylim(0, plot_data['Value'].max() * 1.2) # Give space for labels

# Remove the default legend since the x-axis labels are clear
plt.legend([],[], frameon=False) 

# Display the plot
plt.show()
