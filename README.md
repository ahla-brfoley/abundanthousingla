# Abundant Housing in LA
This repository contains analyses of Los Angeles housing data for the Abundant Housing in LA pro-housing organization. In the interests of transparency, we're providing the code for all our published, and in-house analyses, and links to the data we're using. We'll also make the sources of our data transparent, and all our cleaning and transformation steps will be explicit.

We're commited to promoting exploration and understanding of our data and our analyses. So, the analyses are split by language --- currently [Python](#python_analyses) and [R](#r_analyses). Each analysis is maintained in its own folder, labelled by date posted, and a descriptive caption. We won't change the names of these analyses after they're published. 

Every folder will contain a readme that will explain the data in depth, and the steps we've used to create our analysis, as well as the major results we've found. We encourage you to investigate, and check our work. And if you find any interesting trends or patterns we might have missed, please contact us. We might highlight your findings in our blog or newsletter.

## TOC

2. [DATA](#data)
  * [Data Storage and Downloading](#storage_downloading)
  * [Data Readmes](#data_readmes)
3. [R analyses](#r_analyses)
4. [Python analyses](#python_analyses)

# INSTRUCTIONS TO CONTRIBUTORS

It's important that, for every official analysis we host (merged to Master branch), we make it easy to understand what was done, and make it easy to repeat analyses to get identical results. That means explaining the data: where it came from, what all the variables mean, how to get the data. Explaining how the data was cleaned up and transformed, and how datasets were merged. It also means explaining the packages that were used, and how to get them (this is really important if they're not popular cran or pip packages).

Because this is a volunteer effort, and everyone should be encouraged to contribute, we don't want to be too restrictive. But a couple best-policy guidelines will be helpful. Let's try to document our code (see below) with comments, readmes, and sensible variable names. Let's clearly document our data sources. And let's structure our repository in a sensible way that's clean, light weight, easy to navigate.

## DATA<a name="data"></a>
### Storage and downloading<a name="storage_downloading"></a>
Because of the size of the datasets we're analysing, and because they may be repeatedly updated, we won't store them in the main repository. We will download them, on an as-needed basis, into users' `./localdata` folders. Note that `gitignore` is set to ignore the contents of `./localdata`. All analyses should access the data files in `./localdata/*` by relative path. Filenames and version names should be consistent across analyses. We can either host the files on github, or download them from the original source.

### Data Readmes<a name="data_readmes"></a>
Every dataset should have a column-by-column description of every variable. Raw datasets that need to be downloaded, should have a description of the date they were accessed, a url, and other pertinent metadata. 

Intermediate datasets, produced by merging, or transforming, or cleaning up data should be described in full.

It might be a good idea to have separate scripts for the data manipulation and data analysis/visualisation steps.

### Data formats
Tabular data should be:
* `.csv`(comma delimited, double quote text delimiters)
* utf8 (this should be strongly enforced)
* single table
* No empty lines
* use 'NaN' or 'NA' to indicate missing data

## R analyses<a name="r_analyses"></a>
The major tools that we should expect people to be able to use are Rstudio and jupyter notebook (with an R kernel).

### Relative file location
In order to access files from a relative location in R (without directly editing the script with `setwd()`) every time use `library(here)`. This will set the path root to the git repo root (the folder containing `.git`). If you're using Rstudio, first set your working directory in the console or the 'More' dropdown list in the file browser on the bottom right.

### UTF8 
Character encoding can be a nightmare. All files should be opened and written in utf-8 to maximise compatibility.

[https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding](See how to do this.


## Python analyses<a name="python_analyses"></a>
We should probably just, wherever possible, use Jupyter Notebook instead of worrying about Pycharm or other dev environments.

