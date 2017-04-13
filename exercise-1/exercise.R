# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
new.data <- vehicles[vehicles$year == '1997',]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(new.data$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel <- vehicles[vehicles$drive == '2-Wheel Drive',]
two.wheel.over.20 <- two.wheel[two.wheel$cty > 20,]
# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst <- two.wheel.over.20[two.wheel.over.20$hwy == min(two.wheel.over.20$hwy),'id']

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
most <- function(year, make) {
  first <- vehicles[vehicles$make == make & vehicles$year == year,]
  return(first[first$hwy == max(first$hwy), 'id'])
}

# What was the most efficient honda model of 1995?
most('1995','Honda')

