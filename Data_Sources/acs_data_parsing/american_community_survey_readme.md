# Description
The [American Community Survey](https://www.census.gov/data/developers/data-sets/acs-1year.html) (ACS) is an ongoing survey that provides data every year --- giving communities the current information they need to plan investments and services. The ACS covers a broad range of topics about social, economic, demographic, and housing characteristics of the U.S. population.

The data is available in two temporal scales: 1 year measures, and 5 year aggregates (which are much less noisy). We are working with the 1 year measures, here, and focussing on neighborhoods across Los Angeles city. (is this right? not greater LA or the LA Metropolitan area?)

## Data Retrieval and Concatenation
To [tabulate the ACS data](https://www2.census.gov/programs-surveys/acs/summary_file/2018/documentation/tech_docs/ACS_SF_Excel_Import_Tool.pdf), we need 3 separate files.
1. _Summary File Data_ for a given year
2. _An Excel template_ for a given year
3. _An Excel geography_ file

## Joining to TIGER Shapefiles
In order to visualize the data geographically, we need to join the concatenated data files to the shape files using a GEOID.
1. [Create the geoid variable](https://www2.census.gov/programs-surveys/acs/summary_file/2018/documentation/tech_docs/ACS_SF_TIGERLine_Shapefiles.pdf)
2. [Join the files](https://www.census.gov/programs-surveys/geography/about/training/how-tos.html)

