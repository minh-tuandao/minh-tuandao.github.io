library(readxl)
library(dplyr)

###

# load data
sheets <- excel_sheets("data_viz/assignment02/HPI_2024_public_dataset.xlsx")
# print(sheets)

# We get the table for year 2021
df <- read_excel("data_viz/assignment02/HPI_2024_public_dataset.xlsx", sheet = 2, skip=8)

# Change name of variables:
df <- df %>%
  rename(hpi_rank = `HPI rank`,
         iso = ISO,
         continent = Continent,
         hpi = HPI,
         year_country = ...4,
         pop = `Population (thousands)`,
         lifeexp = `Life Expectancy (years)`,
         wellbeing = `Ladder of life (Wellbeing) (0-10)`,
         carbon = `Carbon Footprint (tCO2e)`,
         co2 = `CO2 threshold for year  (tCO2e)`,
         gdp_cap = `GDP per capita ($)`
         )

### Plot

# Set up the layout with 2 columns and 3 rows
# par(mfrow = c(3, 2)) 

# 1. Scatter plot between two variables 
plot(df$lifeexp, df$hpi, main = "Life Expectancy vs HPI",
     xlab = "Life Expectancy", ylab = "HPI", pch = 19, col = "blue")
abline(lm(df$hpi ~ df$lifeexp), col = "red", lwd = 2)

# 2. Box plot for Carbon Footprint across Continents
boxplot(df$wellbeing ~ df$continent, main = "Wellbeing by Continent", 
        xlab = "Continent", ylab = "Well-Being")
box(lwd = 2)  # Draw a box around the plot

# 3. Histogram of Life Expectancy
hist(df$lifeexp, main = "Histogram of Life Expectancy", 
     xlab = "Life Expectancy", col = "lightgreen", border = "black")
lines(df$lifeexp, dnorm(df$lifeexp), lwd=2)

# 4. Boxplot of Carbon Footprint by Continent
boxplot(df$carbon ~ df$continent, main = "Carbon Footprint by Continent", 
        xlab = "Continent", ylab = "Carbon Footprint (tCO2e)")

# 5. 3D Perspective Plot (using some dummy data for illustration)
x <- seq(60, 90, length.out = 30)
y <- seq(30, 60, length.out = 30)
z <- outer(x, y, FUN = function(x, y) x + y)  # Dummy z data

persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue", 
      xlab = "Life Expectancy", ylab = "HPI", zlab = "Z", main = "3D Perspective Plot")

# 6. Pie chart of HPI Rank Distribution by Continent
continent_counts <- table(df$continent)
pie(continent_counts, labels = c("Latin America", "North America", "Western Europe", 
                                 "Middle East", "Africa", "South Asia", "Eastern Europe & Central Asia",
                                 "East Asia"), 
    main = "Pie Chart of Continent Distribution", col = rainbow(length(continent_counts)))

#dev.off()
#1 - Latin America
#2 - N. America & Oceania
#3 - Western Europe
#4 - Middle East
#5 - Africa
#6 - South Asia
#7 - Eastern Europe & Central Asia
#8 - East Asia
                                 