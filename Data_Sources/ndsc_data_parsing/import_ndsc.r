## WARNING: If you're using Rstudio, first set your working directory in the console 
## or the 'More' dropdown list in the file browser on the bottom right.
### In order to access files from a relative location in R 
### (without directly editing the script with `setwd()`) every time use `library(here)`. 
### This will set the path root to the git repo root (the folder containing `.git`). 

library(here)

if (!('localdata' %in% list.files('../../'))){
  dir.create('../../localdata')
}

dat_list = list(
  list('raw_dat', 
    'http://usc.data.socrata.com/api/views/u7m9-48qx/rows.csv?accessType=DOWNLOAD',
    'Citizen_Connect_Variables__LA_.csv'),
  list('census_tract_shapes',
    'http://usc.data.socrata.com/api/views/i8xf-cx8k/rows.csv?accessType=DOWNLOAD',
    'la_county_tracts_from_jczq_z5ui.csv'),
  list('neighborhood_shapes',
    'http://usc.data.socrata.com/api/views/nm6n-sgfb/rows.csv?accessType=DOWNLOAD',
    'Neighborhoods_from_gw34_aa8i.csv'),
  list('city_shapes',
    'http://usc.data.socrata.com/api/views/a8wh-tdhu/rows.csv?accessType=DOWNLOAD',
    'Los_Angeles_Incorporated_Cities.csv'))

import_data = function(dataset_details){
  if (!(dataset_details[3] %in% list.files('../../localdata/'))){
    print('opportunity!')
  }
}

for (el in dat_list){
  import_data(el)
}
