# Black-Soldier-Fly-R
Data analysis of Black Soldier Fly (Hermetia illucens) experiments using R


1. Project Overview
This repository contains the data and R scripts used to analyze the effect of different feeding treatments on the growth and development of Black Soldier Fly (Hermetia illucens) larvae. The primary goal is to statistically determine if variations in feeding levels lead to significant differences in key growth parameters (Length, Breadth, Weight) , including: Growth Rate (GR%), Substrate Reduction (SR%), Larval Mortality Rate (LM%).

The analysis utilizes ANOVA and post-hoc tests to identify significant differences between treatment groups.

2. Repository Structure
The project is organized into the following directories to ensure clarity and reproducibility:

BSF-Analysis/
├── data/
│   └── BSF_data.xlsx      # Raw experimental data, Real data withheld (unpublished); example dataset included. 
│
├── scripts/
│   └── analysis.R         # R script for data processing, analysis, and visualization
│
├── results/
│   ├── growth_rate_Substrate_reduction_larval_mortality_plot.png      # Output bar chart for other parameters
│   └── analysis_summary.csv                                           # CSV file with summary statistics
│
└── README.md              # This explanatory file

3. The Dataset
The dataset (BSF_data.xlsx) is structured with observations for four treatment groups (T1, T2, T3, T4) across several replications. The key columns are:

Trt: The treatment group (e.g., T1, T2, T3, T4).

Rep: The replication number for each treatment.

Growth Parameters: The specific metric being measured (e.g., Length, Breadth, Weight).

Value: The recorded value for the parameter.

4. Statistical Analysis
The analysis.R script performs the following statistical procedures:

Data Loading and Preparation: Loads the data from the Excel file and converts categorical variables (Trt, Rep) into factors for proper analysis in R.

Analysis of Variance (ANOVA): A one-way ANOVA is conducted to test for significant differences in the means of the growth parameters across the different treatment groups.

Post-Hoc Testing: If the ANOVA results are significant (p < 0.05), a Fisher's LSD (Least Significant Difference) test is performed using the agricolae package to determine which specific treatment groups differ from one another.

Data Visualization: The results are visualized using ggplot2 to create a bar chart showing the mean of each parameter per treatment, complete with error bars (standard deviation) and grouping letters from the post-hoc test.

5. How to Run the Analysis
To reproduce the analysis, follow these steps:

Clone the Repository:

git clone <https://github.com/erikakk101/Black-Soldier-Fly-R.git>

Install R Packages: Open the scripts/analysis.R file in RStudio. The script includes a section to automatically install the required packages if they are not already present. The necessary packages are:

ggplot2
dplyr
readxl
agricolae
variability
psych

Run the Script: Execute the entire analysis.R script. It will:

Load the data from the data/ folder.

Perform the statistical analysis.

Generate and save the plots and summary tables to the results/ folder
