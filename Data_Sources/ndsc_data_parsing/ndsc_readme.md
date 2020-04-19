# Description
The [Neighborhood Data for Social Change](http://la.myneighborhooddata.org/) is a project of the Price School at USC, and provides online mapping tools, and data from the American Community Survey (ACS) (see `../acs_data_parsing/acs_readme.md`) that is aggregated, and mapped to LA Times neighboorhood boundaries. This data is convenient, and ready for display. But note that it is restricted to 5 year sliding windows, and so is not appropriate for statistical modelling.

The website allows for querying data by variable, aggregated at the level of census tract, city, or neighborhood. The entire dataset, consisting of some 2.85m rows, about 660 Gb [can be downloaded](https://usc.data.socrata.com/Los-Angeles/Citizen-Connect-Variables-LA-/u7m9-48qx). Use the script `get_ndsc.py`, which will grab the data and store it as `root/localdata/Citizen_Connect_Variables__LA_.csv`.

Note: The initial concatenation and analysis of NDSC data was conducted as part of the 2019 Data Angels spring project `../../R_analyses/03_2019_data_angels_rental`.

## API

## Available Data


### Variables
The variables in the completed file for `03_2019_data_angels_rental` are :
* `Index` : a unique index for each line, corresponding to a particular year for a particular neighborhood.
* `Year`
* `name`
* `Rent_W`
* `HHs_Rent`
* `Income_W`
* `Income_HHs`
* `Unemploy_Count`
* `Labor_Force_Pop`
* `Burden_Count`
* `Renter_Households`
* `Overcrowd_Count`
* `Total_Households`
* `Stability_Count`
* `Pov_Pop_Above_One_Year`
* `American.Indian.Native.Population`
* `Asian.Population`
* `Black.Population`
* `Hispanic.Population`
* `Native.Hawaiian.Other.Pacific.Islander.Population`
* `Other.Race.Population`
* `Population.of.Two.or.More.Races`
* `White.Population`
* `Total_Population`
* `Weighted_Median_Rent`
* `Weighted_Median_Income`
* `Unemployment_Rate`
* `Rent_Burden_Rate`
* `Overcrowded_Rate`
* `Stability_Rate`
* `American.Indian.Native_Pct`
* `Asian.Population_Pct`
* `Black.Population_Pct`
* `Hispanic.Population_Pct`
* `Native.Hawaiian.Other.Pacific.Islander.Population_Pct`
* `Other.Race.Population_Pct`
* `Population.of.Two.or.More.Races_Pct`
* `White.Population_Pct`
* `ACS_Census_Period`
