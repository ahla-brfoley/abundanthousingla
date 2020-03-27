# R guidelines
The first priorities will always be to explore and communicate data. None of these guidelines should be taken to stop people from trying to discover important patterns. Use the tools and the methods that you need to use to get the job done. But the clarity of analysis, transparency of results, and ease of reproducibility, will always be important. So, we'll work towards helping each other follow best practices, and find the most effective tools.

## Work flow
For those of you who aren't as familiar with R, analyses will likely tend towards the procedural, with a tendency to fewer user defined functions, and no objects. This style works well in a Jupyter notebook, and less-well from the command line.

Having said that, we still should aim for usability standards. As much as we can, we should try to make our code work, without editing, directly from the Master branch git hub repository. That is, the urls should work. Collaborators shouldn't have to insert their own paths, or other values into the code to get it to function. We shouldn't have to comment/uncomment lines too often.

## Relative file location<a name="r_relative_paths"></a>
In order to access files from a relative location in R (without directly editing the script with `setwd()`) every time use `library(here)`. This will set the path root to the git repo root (the folder containing `.git`). If you're using Rstudio, first set your working directory in the console or the 'More' dropdown list in the file browser on the bottom right.

## UTF8<a name="r_utf8"></a>
Character encoding can be a nightmare. It's handled pretty well in Python, but it can be tricky in R. We need to spend a bit of effort ensuring that all files are opened and written in utf-8, to maximise compatibility among datasets, languages, and operating systems.

[https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding](See how to do this.


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
