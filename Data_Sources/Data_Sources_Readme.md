# Description

There are a number of excellent housing-relevant datasets available. These may require specialised api queries and processing. Data sets, data sources, and any queries we expect to use often should be separated from the main analysis. The scripts to import the data, along with detailed variable information, should be described here. All data should be imported locally by the user, and stored in `root/localdata` (where it will be ignored by git). We can worry about hosting some of this data later ourselves, but large, possibly fluid, datasets should never be included in the git repository. They'll cause a lot of headaches for everyone.

## Data Sources

### American Community Survey (ACS)

[The American community survey](https://www.census.gov/programs-surveys/acs) is a yearly survey that provides a wealth of hyperlocal data on demographics and community composition. It comes aggregated at 1, 3, and 5 year levels. This is theoretically the authoritative, and theoretically the best, source of data for modelling housing and economic effects. However, the amount and complexity of the data is nontrivial. 


### Neighborhood Data For Social Change (NDSC)

[Neighborhood Data For Social Change](http://la.myneighborhooddata.org/) comes out of the USC Price Center for Social Innovation, and is a convenient summary of data from the ACS, and a number of other sources (see `./ndsc_data_parsing/neighborhood_metadata_from_ndsc.json` for more details about sources). It is has location data as lat-long, census tract, and neighborhood (as defined by the LA Times).

There is a major dataset that covers all the domains of the NDSC. It's possible to filter this before downloading using the api, but that's more work to set up than I have time or motivation. Instead, we'll download the whole thing and filter it afterwards. There are a few minor datasets associated with the NDSC (for mapping) that are also included in the import. See `./ndsc_data_parsing/ndsc_readme.md` for more details.

## Import scripts
For now there are parallel import scripts for Python and R. The 

## Python
 The Python import requires `requests`, and processing the imported data will require `pandas`. Otherwise, it should just work. For a generic example of how this should be set up, see `./ndsc_data_parsing/import_ndsc.py`.

## R
R imports are a little tricky, in particular because of relative paths (see `root/R_analyses/R_analyses_readme.md` for more details). It will require the library `here`. 

Please _do not set absolute paths_ in a script. It causes unneccesary, idiosyncratic changes when updating git. If you're using R Studio, set the working directory manually, in the command line terminal or the file browser in the lower right. 

For a generic example of how this should be set up, see `./ndsc_data_parsing/import_ndsc.r`.

