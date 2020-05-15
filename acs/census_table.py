import censusdata

class CensusTable():
    """
    Class to store information about different Census Data Tables.
    https://api.census.gov/data.html
    
    Parameters
    ----------
    src (str): Dataset name ("acs1", "acs5", etc)
    year (int): Dataset year
    tablename (int): Dataset table name, first characters of variable names ("DP", "B", "S", etc)
    
    tabletype (str): for querying dataset using censusdata.download()
    """
    def __init__(self, src, year, tablename):
        self.src = src
        self.year = year
        self.tablename = tablename
        self.get_tabletype()

    def get_tabletype(self):
        """Convert tablename to censusdata.download tabletype"""
        if self.tablename == "DP":
            self.tabletype = "profile"
        elif self.tablename == "B":
            self.tabletype = "detail"
        elif self.tablename == "S":
            self.tabletype = "subject"
        elif self.tablename == "CP":
            self.tabletype = "cprofile"
            
    def get_variables_in_table(self):
        """
        Get all variables in a given table.
        * Probably not feasible, very large number of variables per table
        * Hacking around censusdata.search function to find them all.
        """
        return [
            x[0] for x in censusdata.search(
                self.src,
                self.year,
                "",
                "",
                tabletype=self.tabletype
            )
            if x[0].startswith(self.tablename) and "_" in x[0]
        ]