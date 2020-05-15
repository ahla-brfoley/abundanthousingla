import censusdata
import click
import os
import pandas as pd

from acs.census_table import CensusTable
from acs.geocodes import LA_COUNTY

PATH_DATA = "localdata"
PATH_DATA_ACS = os.path.join(PATH_DATA, "acs")

def get_all_variables_in_group(src, year, group):
    """Lookup all variables in Census Data group within table."""
    return list(censusdata.censustable(src, year, group).keys())

@click.command()
@click.argument(
    "src", 
    type=click.Choice(["acs1", "acs3", "acs5"]),
)
@click.argument(
    "year", 
    type=int,
)
@click.argument(
    "table",
    type=click.Choice(["B", "DP", "S", "CP"]),
)
@click.option(
    "--group",
    type=str,
    help="Specify Census Data group (subset of variables)"
)
@click.option(
    "--all-county-subdivisions",
    is_flag=True,
    help="Download data for all LA County subdivisions"
)
def main(src, year, table, group, all_county_subdivisions):
    """
    Download Census Data for a given year. 
    
    src (str): Census data source
    year (int): year of data
    table (str): census data table to download
    """
    ct = CensusTable(src, year, table) # CT instance based on args
    variables = ct.get_variables_in_table() # For now, try to get all variables in table
    if all_county_subdivisions:
        # Generate list of LA county subdivision geography codes
        county_sub_query = censusdata.censusgeo(
            LA_COUNTY + [("county subdivision", "*")]
        )
        # Query census data for those geographies, all variabels in table
        df = censusdata.download(
            ct.src,
            ct.year,
            county_sub_query,
            variables,
            tabletype=ct.tabletype
        )
        # Create path to local data
        savedirectory = os.path.join(PATH_DATA_ACS, "LA_county_subdivisions")
        savefile = os.path.join(savedirectory, f"{ct.src}_{ct.tablename}_{ct.year}.csv")
        os.makedirs(savedirectory, exist_ok=True)
        censusdata.exportcsv(savefile, df)
        
if __name__=='__main__':
    main()