# Abundant Housing in LA
This repository contains analyses of Los Angeles housing data for the Abundant Housing in LA pro-housing organization. In the interests of transparency, we're providing the code for all our published, and in-house analyses, and links to the data we're using. We'll also make the sources of our data transparent, and all our cleaning and transformation steps will be explicit.

We're commited to promoting exploration and understanding of our data and our analyses. So, the analyses are split by language --- currently [Python](#python_analyses) and [R](#r_analyses). Each analysis is maintained in its own folder, labelled by date posted, and a descriptive caption. We won't change the names of these analyses after they're published. 

Every folder will contain a readme that will explain the data in depth, and the steps we've used to create our analysis, as well as the major results we've found. We encourage you to investigate, and check our work. And if you find any interesting trends or patterns we might have missed, please contact us. We might highlight your findings in our blog or newsletter.

## TOC
1. [Instructions To Contributors](#for_contributors)
2. [Data](#data)
  * [Data Storage and Downloading](#storage_downloading)
  * [Data Readmes](#data_readmes)
  * [Data Formats](#data_formats)
3. [Documentation and Style](#documentation)
  * [Comments](#documentation_comments)
  * [Readmes](#documentation_readmes)
  * [Style](#documentation_style)
4. [R Analyses](#r_analyses)
  * [Relative file location](#r_relative_paths)
  * [UTF8](#r_utf8)
5. [Python Analyses](#python_analyses)

# INSTRUCTIONS TO CONTRIBUTORS<a name="for_contributors"></a>
These guidelines are meant to help, not hinder. Because this is a volunteer effort, and everyone is encouraged to contribute, we don't want to be too restrictive. So when you start an analysis don't worry too much about following the guidelines to the letter. Instead, explore, ask questions, and use the tools that you can.

But best-policy guidelines will be extremely helpful in the long run. Let's clearly document our code (see below) with comments, readmes, and sensible variable names. Let's clearly document our data sources. Let's use the best, vetted packages and libraries. And let's structure our repository in a sensible way that's clean, light weight, easy to navigate.

It's important that, for every official analysis we host (merged to Master branch), we make it easy to understand what was done, and make it easy to repeat analyses to get identical results. That means explaining the data: where it came from, what all the variables mean, how to get the data. Explaining how the data was cleaned up and transformed, and how datasets were merged. It also means explaining the packages that were used, and how to get them (this is really important if they're not popular cran or pip packages).

## Data<a name="data"></a>
### Storage and downloading<a name="storage_downloading"></a>
Because of the size of the datasets we're analysing, and because they may be repeatedly updated, we won't store them in the main repository. We will download them, on an as-needed basis, into users' `./localdata` folders. Note that `gitignore` is set to ignore the contents of `./localdata`. All analyses should access the data files in `./localdata/*` by relative path. Filenames and version names should be consistent across analyses. We can either host the files on github, or download them from the original source.

### Data descriptions in the readmes<a name="data_readmes"></a>
Every dataset should have a column-by-column description of every variable. Raw datasets that need to be downloaded, should have a description of the date they were accessed, a url, and other pertinent metadata. 

Intermediate datasets, produced by merging, or transforming, or cleaning up data should be described in full.

It might be a good idea to have separate scripts for the data manipulation and data analysis/visualisation steps.

### Data formats<a name="data_formats"></a>
Tabular data should be:
* `.csv`(comma delimited, double quote text delimiters)
* utf8 (this should be strongly enforced)
* single table
* No empty lines
* use 'NaN' or 'NA' to indicate missing data

## Documentation and Style<a name="documentation"></a>
Yeah yeah. Everyone agrees that code needs to be documented. And everyone says they're going to do it. But we never document to the level we aspire. Documentation is a pain, it sometimes feels like a distraction. 

### Comments<a name="documentation_comments"></a>
Please comment your code, as fully as possible.

* for functions, explain what arguments the function takes, the value it returns, and what the general purpose of the function is.
* for procedural analyses (e.g. most R analyses) please lay out the work flow.
* use descriptive variable names, that don't repeat, as the best kind of comment.

### Readmes<a name="documentation_readmes"></a>
The readmes should be in markdown (`.md`) format. At a minimum, a readme needs to describe the data and its provenance in detail. It needs to describe all files, including code. It should explain the broad methods used, in cleaning, merging, and analysing data. And it should explain the major conclusions.

Please use correct headings and document structure. Variable names, and single line code samples, should be flanked with "\`" the backtick code delimiter. Code blocks should be fenced in with three code tick format. [There are plenty of cheatsheets available](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet). The emphasis here is on readablity and clarity, not enforcing any one style.

### Style<a name="documentation_style"></a>
Pick a style and stick with it, within an analysis. 

* camel case OR underscores
* consistent use of capitalisation for functions, variables, and classes
* it would be really nice if Python analyses tried to [adhere to to Pep 8](https://www.python.org/dev/peps/pep-0008/)

## R analyses<a name="r_analyses"></a>
The major tools that we should expect people to be able to use are Rstudio and jupyter notebook (with an R kernel).

### Relative file location<a name="r_relative_paths"></a>
In order to access files from a relative location in R (without directly editing the script with `setwd()`) every time use `library(here)`. This will set the path root to the git repo root (the folder containing `.git`). If you're using Rstudio, first set your working directory in the console or the 'More' dropdown list in the file browser on the bottom right.

### UTF8<a name="r_utf8"></a>
Character encoding can be a nightmare. It's handled pretty well in Python, but it can be tricky in R. We need to spend a bit of effort ensuring that all files are opened and written in utf-8, to maximise compatibility among datasets, languages, and operating systems.

[https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding](See how to do this.

## Python analyses<a name="python_analyses"></a>
Python 2.7 is dead. Let's only use Python >3.6. 

We should probably just, wherever possible, use Jupyter Notebook instead of worrying about Pycharm or other dev environments? This will need to be discussed---maybe let's watch what happens, and answer this question later.

