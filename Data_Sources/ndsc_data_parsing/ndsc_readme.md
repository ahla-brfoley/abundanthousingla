# Description
The [Neighborhood Data for Social Change](http://la.myneighborhooddata.org/) is a project of the Price School at USC, and provides online mapping tools, and data from the American Community Survey (ACS) (see `../acs_data_parsing/acs_readme.md`) that is aggregated, and mapped to LA Times neighboorhood boundaries. This data is convenient, and ready for display. But note that it is restricted to 5 year sliding windows, and so is not appropriate for statistical modelling.

The website allows for querying data by variable, aggregated at the level of census tract, city, or neighborhood. The entire dataset, consisting of some 2.85m rows, about 660 Gb [can be downloaded](https://usc.data.socrata.com/Los-Angeles/Citizen-Connect-Variables-LA-/u7m9-48qx). Use the script `get_ndsc.py`, which will grab the data and store it as `root/localdata/Citizen_Connect_Variables__LA_.csv`.

Note: The initial concatenation and analysis of NDSC data was conducted as part of the 2019 Data Angels spring project `../../R_analyses/03_2019_data_angels_rental`.

## API

### Citizen_Connect_Variables__LA_.csv
The Citizen Connect Variables dataset that can be downloaded from MyNeighborhoodData.org has the following columns:
* `Policy Area` : `string` can be of 10 areas
* `Dataset` : `string` one of a variable numbers of sub-areas within `Policy Area`
* `Variable` : `string` class variable within sub-area
* `Name` : ???
* `Date` : Looks like `dd/mm/yyyy` format
* `geoid` : [Geographic identifiers](https://www.census.gov/programs-surveys/geography/guidance/geo-identifiers.html)
* `Tract` : `int` Census tract identifier
* `Neighborhood` : `string` LA Times neighborhood
* `Value` : `numeric` the value of the metric
* `Denominator` : a value "For calculation of weighted averages by population, area or other number"
* `Denominator Description` : `string` a written explanation of what the denominator is
* `Row ID` : `string` seems to be a concatenation of `Variable`, `Date` year, and `geoid`
* `Location 1` : `string` parentheses surrounding comma separated lattitude and longitude (decimal format)
* `Latitude` : `numeric` often missing, but when present, the numeric value of lat from `Location 1`
* `Longitude` : `numeric` often missing, but when present, the numeric value of long from `Location 1`
