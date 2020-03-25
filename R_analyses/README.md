# R guidelines
The first priorities will always be to explore and communicate data. None of these guidelines should be taken to stop people from trying to discover important patterns. Use the tools and the methods that you need to use to get the job done. But the clarity of analysis, transparency of results, and ease of reproducibility, will always be important. So, we'll work towards helping each other follow best practices, and find the most effective tools.

## Work flow
For those of you who aren't as familiar with R, analyses will likely tend towards the procedural, with a tendency to fewer user defined functions, and no objects. This style works well in a Jupyter notebook, and less-well from the command line.

Having said that, we still should aim for usability standards. As much as we can, we should try to make our code work, without editing, directly from the Master branch git hub repository. That is, the urls should work. Collaborators shouldn't have to insert their own paths, or other values into the code to get it to function. We shouldn't have to comment/uncomment lines too often.

## Recommended packages
Where possible, we should try and use a common set of packages. This will make our analyses more comparable, and will build up a level of shared expertise that will help us check each others' work, and help each other with problems.

Note: Some of these packages have complicated dependencies. We should document these for Linux, Windows and OSX.

### Directory structure and navigation
* _here_        - constructing relative paths at a project level

### Tidyverse
Hadley Wickham's attempt to promote clean data, and a sane approach to analyzing data, and developing tools
* _dplyr_       - reformatting dataframes in sane ways
* _devtools_    - make packages and tools for R easily
* _stringr_     - powerful string manipulation and language tools package
* _ggplot2_     - a flexible package for plotting in R 
* _ggrepel_     - provides geoms for ggplot2 to repel overlapping text labels

### Mapping
* _maps_       - standard package
* _mapdata_     - standard package
* _choroplethr_ - choropleth maker
* _zipcode_     - zipcode boundaries
* _tigris_      - zcta boundaries (like zip codes, but better!)
* _viridis_     - color pallette
* _scales_      - legend labels
* _dkahle/ggmap_    - ggmap, github source. install using install_github.
* _arilamstein/choroplethrZip@v1.5.0_   - dataframe with ZCTA boundaries, github source. install using install_github.
* _googleway_   - interactive google maps
* _ggpol_       - an extension of ggplot for political charts
* _geosphere_   - spherical trigonometry functions for geographic applications


