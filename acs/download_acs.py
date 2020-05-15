import censusdata
import click
import pandas as pd

from census_table import CensusTable
from geocodes import LA_COUNTY

def get_all_variables_in_group(src, year, group):
    """
    Lookup all variables in Census Data group within table.
    """
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
@click.argument(
    "group",
    type=str,
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
    group (str): table group ID. Ideally, would download all groups for given table.
    """
    ct = CensusTable(src, year, table)
    #variables = get_all_variables_in_group(src, year, group)
    variables = ct.get_variables_in_table()
    print(variables)
    if all_county_subdivisions:
        county_sub_query = censusdata.censusgeo(
            LA_COUNTY + [("county subdivision", "*")]
        )
        
        df = censusdata.download(
            ct.src,
            ct.year,
            county_sub_query,
            variables,
            tabletype=ct.tabletype
        )
        censusdata.exportcsv(f"{ct.src}_{ct.table}_{ct.year}.csv", df)
        
if __name__=='__main__':
    main()