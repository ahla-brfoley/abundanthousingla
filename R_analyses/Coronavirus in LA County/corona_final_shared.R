## Install and set up all the packages

#install.packages(c("ggplot2", "devtools", "dplyr", "stringr"))
#install.packages(c("maps", "mapdata")) #standard map packages
#install.packages("zipcode") #install ZIP code to lat-long database
#install.packages("choroplethr") #choropleth maker
#install.packages("devtools")
#install.packages("tigris") #zcta boundaries
#install.packages("viridis") #better color palette
#install.packages("scales") #better labels on legend
#devtools::install_github("dkahle/ggmap") #ggmap, github source
#install.packages("googleway") # interactive google maps
#install.packages("ggpol")
#install.packages("geosphere")
#install.packages("ggrepel")
#install.packages("rgeos")

## Load from library

library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(stringr)
library(dplyr)
library(devtools)
library(choroplethrZip)
library(viridis)
library(scales)
library(googleway)
library(ggpol)
library(geosphere) # computes distances between two sets of coordinates
library(ggrepel) # makes it easier to add labels
library(rgdal) # use to upload shapefiles
library(raster) # maybe a different way to upload shapefiles
library(cowplot) # allows you to plot multiple plots side by side
library(shades) # lets you make color palettes lighter/darker
library(tidyr)
library(rgeos)

## import data and set up views
setwd("xxxx") # input your working drive
getwd()
data <- read.csv("corona_r.csv")
head(data)
nrow(data)

## convert columns to numeric
str(data) # everything is numeric or integer

## add a column for non-white population
data$pct_nonwhite <- 1 - data$pct_white
head(data)

## add a column for combined black and Latino population
data$pct_b_l <- data$pct_black + data$pct_latino
head(data)

## create subset of neighborhoods with >=20 COVID cases
data_20 <- subset(data, covid_cases > 19)
head(data_20)
nrow(data_20) # 174 rows

## look for skew in the data
hist(data_20$lacounty_rate) # skewed, need to log transform
hist(data_20$below_poverty_line) # not as skewed
hist(data_20$hh_overcrowding) # skewed
hist(data_20$housing_density) # skewed
hist(data_20$pct_nonwhite) # skewed
hist(data_20$pct_white) # skewed
hist(data_20$pct_black) # skewed
hist(data_20$pct_latino) # not very skewed
hist(data_20$pct_asian) # skewed
hist(data_20$pct_b_l) # not that skewed

## create quintiles

data_20$poverty_quintile <- 
                    ifelse(data_20$below_poverty_line < 0.1, "0-9.9%",
                    ifelse(data_20$below_poverty_line >= 0.1 & data_20$below_poverty_line < 0.15, "10-14.9%",
                    ifelse(data_20$below_poverty_line >= 0.15 & data_20$below_poverty_line < 0.2, "15-19.9%",
                    ifelse(data_20$below_poverty_line >= 0.2 & data_20$below_poverty_line < 0.25, "20-24.9%",
                    "25%+"            
                        ))))

data_20$overcrowding_quintile <- 
  ifelse(data_20$hh_overcrowding < 0.05, "0-4.9%",
         ifelse(data_20$hh_overcrowding >= 0.05 & data_20$hh_overcrowding < 0.1, "5-9.9%",
                ifelse(data_20$hh_overcrowding >= 0.1 & data_20$hh_overcrowding < 0.15, "10-14.9%",
                       ifelse(data_20$hh_overcrowding >= 0.15 & data_20$hh_overcrowding < 0.2, "15-19.9%",
                              "20%+"            
                       ))))

data_20$nonwhite_quintile <- 
  ifelse(data_20$pct_nonwhite < 0.3, "0-29.9%",
         ifelse(data_20$pct_nonwhite >= 0.3 & data_20$pct_nonwhite < 0.5, "30-49.9%",
                ifelse(data_20$pct_nonwhite >= 0.5 & data_20$pct_nonwhite < 0.7, "50-69.9%",
                       ifelse(data_20$pct_nonwhite >= 0.7 & data_20$pct_nonwhite < 0.9, "70-89.9%",
                              "90%+"            
                       ))))
tail(data_20)

data_20$b_l_quintile <- 
  ifelse(data_20$pct_b_l < 0.2, "0-19.9%",
         ifelse(data_20$pct_b_l >= 0.2 & data_20$pct_b_l < 0.4, "20-39.9%",
                ifelse(data_20$pct_b_l >= 0.4 & data_20$pct_b_l < 0.6, "40-59.9%",
                       ifelse(data_20$pct_b_l >= 0.6 & data_20$pct_b_l < 0.8, "60-79.9%",
                              "80%+"            
                       ))))

data_20$latino_quintile <- 
  ifelse(data_20$pct_latino < 0.2, "0-19.9%",
         ifelse(data_20$pct_latino >= 0.2 & data_20$pct_latino < 0.4, "20-39.9%",
                ifelse(data_20$pct_latino >= 0.4 & data_20$pct_latino < 0.6, "40-59.9%",
                       ifelse(data_20$pct_latino >= 0.6 & data_20$pct_latino < 0.8, "60-79.9%",
                              "80%+"            
                       ))))

tail(data_20)

data_20$home_density_quintile <- 
  ifelse(data_20$housing_density < 1500, "0-1,500 homes / sq mi",
         ifelse(data_20$housing_density >= 1500 & data_20$housing_density < 3000, "1,500-2,999 homes / sq mi",
                ifelse(data_20$housing_density >= 3000 & data_20$housing_density < 4500, "3,000-4,499 homes / sq mi",
                       ifelse(data_20$housing_density >= 4500 & data_20$housing_density < 6000, "4,500-5,999 homes / sq mi",
                              "6,000+ homes / sq mi"            
                       ))))

tail(data_20)

## measure COVID rates by quintiles

covid_poverty <- data_20 %>%
  group_by(poverty_quintile) %>%
  summarise(areas=n()
            , covid_cases=sum(covid_cases)
            , total_population=sum(Population)
            , case_rate=(covid_cases/total_population)*1000)
covid_poverty # poorer areas have higher COVID rates
write.csv(covid_poverty, "covid_poverty.csv") # export

covid_crowding <- data_20 %>%
  group_by(overcrowding_quintile) %>%
  summarise(areas=n()
            , covid_cases=sum(covid_cases)
            , total_population=sum(Population)
            , case_rate=(covid_cases/total_population)*1000) %>%
  arrange(match(overcrowding_quintile, c("0-4.9%", "5-9.9%", "10-14.9%", "15-19.9%", "20%+")))
covid_crowding # areas with more crowding have higher COVID rates, though not a perfect relationship
write.csv(covid_crowding, "covid_crowding.csv") # export

covid_nonwhite <- data_20 %>%
  group_by(nonwhite_quintile) %>%
  summarise(areas=n()
            , covid_cases=sum(covid_cases)
            , total_population=sum(Population)
            , case_rate=(covid_cases/total_population)*1000) 
covid_nonwhite # less clear pattern, but the areas with highest minority pop shares have the most COVID
write.csv(covid_nonwhite, "covid_nonwhite.csv") # export

covid_black_latino <- data_20 %>%
  group_by(b_l_quintile) %>%
  summarise(areas=n()
            , covid_cases=sum(covid_cases)
            , total_population=sum(Population)
            , case_rate=(covid_cases/total_population)*1000) 
covid_black_latino # less clear pattern, but the most black, Latino areas have the most COVID

covid_latino <- data_20 %>%
  group_by(latino_quintile) %>%
  summarise(areas=n()
            , covid_cases=sum(covid_cases)
            , total_population=sum(Population)
            , case_rate=(covid_cases/total_population)*1000) 
covid_latino # more Latino areas have more COVID
write.csv(covid_latino, "covid_latino.csv") # export

covid_home_density <- data_20 %>%
  group_by(home_density_quintile) %>%
  summarise(areas=n()
            , covid_cases=sum(covid_cases)
            , total_population=sum(Population)
            , case_rate=(covid_cases/total_population)*1000) 
covid_home_density # some link between home density and COVID, but densest areas don't have highest rate
write.csv(covid_home_density, "covid_home_density.csv") # export

## log transformations, helpful source: https://kenbenoit.net/assets/courses/ME104/logmodels2.pdf

data_20$log_lacounty_rate <- log(data_20$lacounty_rate)
hist(data_20$log_lacounty_rate) # much better, not skewed anymore

data_20$log_below_poverty_line <- log(100*data_20$below_poverty_line)
hist(data_20$log_below_poverty_line) # less skewed

data_20$log_hh_overcrowding <- log(100*data_20$hh_overcrowding+1)
hist(data_20$log_hh_overcrowding) # less skewed

data_20$log_pct_nonwhite <- log(100*data_20$pct_nonwhite)
hist(data_20$log_pct_nonwhite) # still skewed

data_20$log_pct_black <- log(100*data_20$pct_black+1)
hist(data_20$log_pct_black) # less skewed

data_20$log_pct_latino <- log(100*data_20$pct_latino+1)
hist(data_20$log_pct_latino) # still skewed

data_20$log_pct_asian <- log(100*data_20$pct_asian+1)
hist(data_20$log_pct_asian) # less skewed

data_20$log_pct_white <- log(100*data_20$pct_white+1)
hist(data_20$log_pct_white) # less skewed

data_20$log_pct_b_l <- log(100*data_20$pct_b_l+1)
hist(data_20$log_pct_b_l) # still super skewed

data_20$log_housing_density <- log(100*data_20$housing_density)
hist(data_20$log_housing_density) # much less skewed
 
## create scatters

plot(data_20$log_lacounty_rate, data_20$hh_overcrowding, main="COVID vs. Overcrowding",
     xlab="ln(COVID Cases per 1,000 Residents)", ylab="% Overcrowded",  pch=19)
abline(lm(data_20$hh_overcrowding~data_20$log_lacounty_rate), col="red")

plot(data_20$log_lacounty_rate, data_20$below_poverty_line, main="COVID vs. Poverty",
     xlab="ln(COVID Cases per 1,000 Residents)", ylab="% in Poverty",  pch=19)
abline(lm(data_20$below_poverty_line~data_20$log_lacounty_rate), col="red")

plot(data_20$log_lacounty_rate, data_20$pct_nonwhite, main="COVID vs. Nonwhite Population",
     xlab="ln(COVID Cases per 1,000 Residents)", ylab="% Nonwhite",  pch=19)
abline(lm(data_20$pct_nonwhite~data_20$log_lacounty_rate), col="red")

plot(data_20$log_lacounty_rate, data_20$log_housing_density, main="COVID vs. Home Density",
     xlab="ln(COVID Cases per 1,000 Residents)", ylab="ln(Homes per Sq. Mi)",  pch=19)
abline(lm(data_20$log_housing_density~data_20$log_lacounty_rate), col="red")

## turn percentage variables into a 100-pt scale

data_20$hh_overcrowding <- data_20$hh_overcrowding*100
data_20$below_poverty_line <- data_20$below_poverty_line*100
data_20$pct_nonwhite <-data_20$pct_nonwhite*100
data_20$pct_white <-data_20$pct_white*100
data_20$pct_black <-data_20$pct_black*100
data_20$pct_latino <- data_20$pct_latino*100
data_20$pct_asian <- data_20$pct_asian*100
data_20$pct_b_l <- data_20$pct_b_l*100
head(data_20)

## check correlations between variables

cor(data_20[,c('lacounty_rate', 'below_poverty_line', 'hh_overcrowding', 'housing_density', 'pop_density', 'pct_black','pct_asian','pct_latino','pct_nonwhite')])  
# Housing density and pop density are too correlated, only include one of them
# Latino population and household overcrowding are too correlated, only include one of them

## create univariate regressions

overcrowding <- lm(log_lacounty_rate ~ hh_overcrowding, data=data_20)
summary(overcrowding) # a 1-pct point increase in crowded share associated with 2.1% increase in COVID rate
# stat sig at 0.1% level, r2 is 0.17

poverty <- lm(log_lacounty_rate ~ below_poverty_line, data=data_20)
summary(poverty) # a 1-pct point increase in poverty share associated with 2.4% increase in COVID rate
# stat sig at 0.1% level, r2 is 0.19

minority <- lm(log_lacounty_rate ~ pct_nonwhite, data=data_20)
summary(minority) # a 1-pct point increase in poverty share associated with 0.4% increase in COVID rate
# stat sig at 5% level, r2 is 0.04, not much explanatory power

black <- lm(log_lacounty_rate ~ pct_black, data=data_20)
summary(black) # a 1-pct point increase in black share associated with 0.7% increase in COVID rate
# stat sig at 5% level, r2 is 0.03, not much explanatory power

latino <- lm(log_lacounty_rate ~ pct_latino, data=data_20)
summary(latino) # a 1-pct point increase in Latino share associated with 0.6% increase in COVID rate
# stat sig at 0.1% level, r2 is 0.13

asian <- lm(log_lacounty_rate ~ pct_asian, data=data_20)
summary(asian) # a 1-pct point increase in Asian share associated with 0.2% DECREASE in COVID rate
# stat sig at 1% level, r2 is 0.23

white <- lm(log_lacounty_rate ~ pct_white, data=data_20)
summary(white) # a 1-pct point increase in white share associated with 0.3% DECREASE in COVID rate
# stat sig at 5% level, r2 is 0.04

black_latino <- lm(log_lacounty_rate ~ pct_b_l, data=data_20)
summary(black_latino) # a 1-pct point increase in the combined black + Latino share associated with 0.6% increase in COVID rate
# stat sig at 0.1% level, r2 is 0.15

home_density <- lm(log_lacounty_rate ~ log_housing_density, data=data_20)
summary(home_density) # a 1% increase in home density associated with 0.2% increase in COVID rate
# stat sig at 0.1% level, r2 is 0.11

## create multivariate regressions

two_factor <- lm(log_lacounty_rate ~ below_poverty_line 
                                   + hh_overcrowding, data=data_20)
summary(two_factor) # poverty significant, overcrowding not significant, r2 = 0.20

three_factor <- lm(log_lacounty_rate ~ below_poverty_line 
                                     + hh_overcrowding 
                                     + pct_nonwhite, data=data_20)
summary(three_factor) # this is the most interesting model so far
# interesting that there's a negative sign on pct_nonwhite
# probably bc asian and black/Latino coefficients have different signs, r2 = 0.23
# this is equivalent to the Harvard public health model - https://cdn1.sph.harvard.edu/wp-content/uploads/sites/1266/2020/04/HCPDS_Volume-19_No_1_20_covid19_RevealingUnequalBurden_HCPDSWorkingPaper_04212020-1.pdf

four_factor <- lm(log_lacounty_rate ~ below_poverty_line 
                  + hh_overcrowding 
                  + pct_nonwhite
                  + log_housing_density, data=data_20)
summary(four_factor) # this is an interesting model to compare to the three_factor model
# adding housing density to three_factor does not make model stronger, no increase in adj-r2
# housing density has small coefficient, 10% stat sig
# nonwhite coefficient sign is still negative


