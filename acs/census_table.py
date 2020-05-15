import censusdata

class CensusTable():
    def __init__(self, src, year, tablename):
        self.src = src
        self.year = year
        self.tablename = tablename
        self.get_tabletype()

    def get_tabletype(self):
        if self.tablename == "DP":
            self.tabletype = "profile"
        elif self.tablename == "B":
            self.tabletype = "detail"
        elif self.tablename == "S":
            self.tabletype = "subject"
        elif self.tablename == "CP":
            self.tabletype = "cprofile"
            
    def get_variables_in_table(self):
        # hack around search function
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