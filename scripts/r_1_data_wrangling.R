# CTU Workshop 1 3/13/2026

# Author:   Chris Poulos
# Date:     3/13/2026
# Updated:  

# Topics - 

# 1) Setting up and using RStudio

# 2) Creating and navigating to a work space

# 3) Data structures

# 3.1) Objects- AKA variables. Object hold data

# character (string) data

# Store data in an object with "<-" or "="

object <- "blah"
object2 = "blah2"

class(object)

# numeric data

a <- 30*30
class(a)

# 3.2) vector data (think: a column in excel)

column_a <- c(1,2,3)
column_b <- c("a","b","c")

# 3.3)  data frames aka tabular data (think: a spread sheet in excel).


# 3.4) Create a data frame using data.frame - a built in R function

df1 <- data.frame(
  fruit = c("Apples","Bananas","Avocados"),
  count = c(3,12,5),
  quality = c("Good","Good","Bad")
)

# exploring data classes

class(df1$fruit)
class(df1$count)
class(df1$quality)


# 3.5) Creating a data frame with vector data

df2 <- data.frame(column_a,column_b)

# 3.6) Read in a spread sheet as a dataframe

mil_ref <- read.csv("C:/Users/christopherpoulos/work/projects/r_ctu_workshop/data/raw/millionaire_tax_referendum_2024.csv")

# Explore column names

colnames(mil_ref)

mil_ref_cols = data.frame(colnames(mil_ref))

# 3.7) Adding new vectors (columns)

df3$percent_yes = df3$YES/(df3$NO+df3$YES)
df3$percent_turnout = (df3$YES+df3$NO)/df3$Registration

# Useful to check working. Applies the same steps for all rows. More legible than excel. When this goes wrong in excel - EBF Excel Example  

# 4) Installing and loading packages

# Package is a set of tools in R.

# Only need to install once

install.packages("tidyverse") 
install.packages("tidycensus") 

# For CTU - To avoid permissions issues, create a user library

# Create User library
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)


# Set path hierarchy so user library is first, then the system library

.libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))

# Install xml2 and tidycensus into user library

install.packages("tidycensus", lib = Sys.getenv("R_LIBS_USER"), dependencies = TRUE)

# Load in package

library(tidyverse)
library(tidycensus)

# Get census API key (https://api.census.gov/data/key_signup.html)

census_api_key("c057294e4fae51ea38e8fc2898e583a8c7693c04",install=TRUE) # Set to TRUE means you don't have to do this in the future.

# You can ignore this - Using an environmental variable
#census_api_key(api_key,install=TRUE) # Set to TRUE means you don't have to do this in the future.
#api_key <- Sys.getenv("census_api_key")

# Getting ACS data

acs_vars <- load_variables(year=2023,"acs5",cache=TRUE)

total3 <- get_acs(
  geography = "tract",
  variables = "B01001_001",
  state = 17,
  county = 031,
  year = 2023
)

und_5_boys <- get_acs(
  geography = "tract",
  variables = "B01001_003",
  variables = "B01001_001",
  state = 17,
  county = 031,
  year = 2023
)

und_5_girls <- get_acs(
  geography = "tract",
  variables = "B01001_027",
  variables = "B01001_001",
  state = 17,
  county = 031,
  year = 2023
)


