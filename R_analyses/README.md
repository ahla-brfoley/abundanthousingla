# R guidelines
The first priorities will always be to explore and communicate data. None of these guidelines should be taken to stop people from trying to discover important patterns. Use the tools and the methods that you need to use to get the job done. But the clarity of analysis, transparency of results, and ease of reproducibility, will always be important. So, we'll work towards helping each other follow best practices, and find the most effective tools.

## Work flow
As much as we can, we should try to make our code work, without editing, directly from the Master branch git hub repository. That is, the urls should work. Collaborators shouldn't have to insert their own paths, or other values into the code to get it to function. We shouldn't have to comment/uncomment lines too often.

## Recommended packages
Where possible, we should try and use a common set of packages. This will make our analyses more comparable, and will build up a level of shared expertise that will help us check each others' work, and help each other with problems.

Note: Some of these packages have complicated dependencies. We should document these for Linux, Windows and OSX.

### 
# Directory structure and navigation
* here          - constructing relative paths at a project level

### Tidyverse
# Hadley Wickham's attempt to promote clean data 
# and a sane approach to analyzing data, and developing tools
* dplyr         - reformatting dataframes in sane ways
* devtools      - make packages and tools for R easily
* stringr       - powerful string manipulation and language tools package
* ggplot2       - a flexible package for plotting in R 
* ggrepel       - provides geoms for ggplot2 to repel overlapping text labels

### Mapping
* maps          - standard package
* mapdata       - standard package
* choroplethr   - choropleth maker
* zipcode       - zipcode boundaries
* tigris        - zcta boundaries (like zip codes, but better!)
* viridis       - color pallette
* scales        - legend labels
* dkahle/ggmap  - ggmap, github source. install using install_github.
* arilamstein/choroplethrZip@v1.5.0 - dataframe with ZCTA boundaries, github source. install using install_github.
* googleway     - interactive google maps
* ggpol         - an extension of ggplot for political charts
* geosphere     - spherical trigonometry functions for geographic applications


