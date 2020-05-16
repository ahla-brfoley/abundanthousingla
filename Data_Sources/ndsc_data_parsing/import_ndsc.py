

def create_dat_files():
    """
    The json file describing all the datasets that should be included in the full ndsc import
    """
    dat_files = {'raw_dat':{'url':'http://usc.data.socrata.com/api/views/u7m9-48qx/rows.csv?accessType=DOWNLOAD',
                           'filename':'Citizen_Connect_Variables__LA_.csv'},
                 'census_tract_shapes':{'url':'http://usc.data.socrata.com/api/views/i8xf-cx8k/rows.csv?accessType=DOWNLOAD',
                                 'filename':'la_county_tracts_from_jczq_z5ui.csv'},
                 'neighborhood_shapes':{'url':'http://usc.data.socrata.com/api/views/nm6n-sgfb/rows.csv?accessType=DOWNLOAD',
                                 'filename':'Neighborhoods_from_gw34_aa8i.csv'},
                 'city_shapes':{'url':'http://usc.data.socrata.com/api/views/a8wh-tdhu/rows.csv?accessType=DOWNLOAD',
                                 'filename':'Los_Angeles_Incorporated_Cities.csv'}
                }
    return dat_files

def import_data(which_data):
    """
    import the specified dataset from dat_files
    if it doesn't already exist
    note: we might want to include a force-overwrite term as a nice-to-have
    """
    # available at https://ladata.myneighborhooddata.org/#!/view-data
    filepath = "../../localdata/" + which_data['filename']
    if not path.exists(filepath):
        filepath
        data_file = requests.get(which_data['url'])
        open(filepath, 'wb').write(data_file.content)
    return True

if __name__ == '__main__':
    """
    A nice-to-have would be command line import 
    """
    import requests
    from os import path
    dat_files = create_dat_files()
    for key, val in dat_files.items():
       import_data(val)

