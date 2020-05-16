# Description
The [Neighborhood Data for Social Change](http://la.myneighborhooddata.org/) is a project of the Price School at USC, and provides online mapping tools, and data from the American Community Survey (ACS) (see `../acs_data_parsing/acs_readme.md`) that is aggregated, and mapped to LA Times neighboorhood boundaries. This data is convenient, and ready for display. But note that it is restricted to 5 year sliding windows, and so is not appropriate for statistical modelling.

The website allows for querying data by variable, aggregated at the level of census tract, city, or neighborhood. The entire dataset, consisting of some 2.85m rows, about 660 Gb [can be downloaded](https://usc.data.socrata.com/Los-Angeles/Citizen-Connect-Variables-LA-/u7m9-48qx). Use the script `get_ndsc.py`, which will grab the data and store it as `root/localdata/Citizen_Connect_Variables__LA_.csv`.

Note: The initial concatenation and analysis of NDSC data was conducted as part of the 2019 Data Angels spring project `../../R_analyses/03_2019_data_angels_rental`.

## Imports
Use either `import_ndsc.r` or `import_ndsc.py` to import the data. Note, if you're using R, to be careful about relative paths, and don't hard code your own paths in any scripts that might be later pushed to git.

These two scripts are probably decent generic templates for how we want to handle data imports generally.

## API

Screw the api. It's too complicated.

## Files

### import_ndsc.py, import_ndsc.r

These should just work. They've been tested with:   
* Python 3.6, in Jupyter Notebook and console  
* and R version 3.6.3 (in R Studio)  

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

### neighborhood_metadata_from_ndsc.json

A detailed description of the data, where it was obtained, and what it contains. This was manually curated from data from the NDSC website, and it seems to be out of date already. Some of the data described on the website doesn't seem to exist in the downloaded file. 

It needs to be checked, with regards to the years of data that are available. There maye be data for years not included in the json.

### ndsc_import.ipynb

The scratchpad used to develop the python code. This will eventually be deleted, but there will be some readme.json code still to come out of it. **Normally, this kind of intermediary file would never make it to the master branch.**

### credentials.dummy

Probably not important. When using the api, apparently we'll want to register and get a set of credentials (app token and stuff). This might be cool, some day.
