# 1. ANOVA Test
# This checks if there is a statistically significant difference in the mean of L2
# among the different treatment groups ('Trt').
anova = aov(L2 ~ Trt, data = newdata) 
summary(anova) # This prints the result, including the all-important p-value.

# 2. Post-Hoc Test
# If the anova p-value is significant (< 0.05), this test finds out
# *which specific treatments* are different from each other.
posthoc = LSD.test(anova, "Trt", alpha = 0.05)
posthoc

# 3. Extract Grouping Letters
# This extracts the letters (a, b, ab etc.) that show which groups are not
# significantly different from each other. This is useful for plots.
a = posthoc$groups
a1 = a[order(row.names(a)),]
a1

# 4. Genetic Variability
# The gen.var() function from the 'variability' package calculates parameters
# like genotypic (GCV) and phenotypic (PCV) coefficients of variation.
library(variability)
gen.var(newdata[4], newdata$Trt, newdata$Rep) # It's safer to use newdata$L2 instead of newdata[4]

# 5. Create a Summary Data Frame for Plotting
# This block neatly organizes the mean, standard deviation, and grouping letters
# for each treatment, which is perfect for making a publication-quality graph.
msd = posthoc$means[1:2]
roundmsd = round(msd, digits = 2)
dt = data.frame(Treatment = row.names(roundmsd), mean = roundmsd[,1], 
                STD = roundmsd[,2], group = a1[,2])
dt
