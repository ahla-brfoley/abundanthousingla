# Description
The [American Community Survey](https://www.census.gov/data/developers/data-sets/acs-1year.html) (ACS) is an ongoing survey that provides data every year --- giving communities the current information they need to plan investments and services. The ACS covers a broad range of topics about social, economic, demographic, and housing characteristics of the U.S. population.

The data is available in two temporal scales: 1 year measures, and 5 year aggregates (which are much less noisy). We are working with the 1 year measures, here, and focussing on neighborhoods across Los Angeles city. (is this right? not greater LA or the LA Metropolitan area?)

## Data Retrieval and Concatenation
To [tabulate the ACS data](https://www2.census.gov/programs-surveys/acs/summary_file/2018/documentation/tech_docs/ACS_SF_Excel_Import_Tool.pdf), we need 3 separate files.
1. _Summary File Data_ for a given year
2. _An Excel template_ for a given year
3. _An Excel geography_ file

# Variables
The variables in the completed file are :
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
