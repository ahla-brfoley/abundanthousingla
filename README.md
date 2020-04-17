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
4. [To Do](#to_do)
  * [Data Curation](#data_curation)
  * [Open Research](#open_research)

## INSTRUCTIONS TO CONTRIBUTORS<a name="for_contributors"></a>
These guidelines are meant to help, not hinder. Because this is a volunteer effort, and everyone is encouraged to contribute, we don't want to be too restrictive. So when you start an analysis don't worry too much about following the guidelines to the letter. Instead, explore, ask questions, and use the tools that you can.

But best-policy guidelines will be extremely helpful in the long run. Let's clearly document our code (see below) with comments, readmes, and sensible variable names. Let's clearly document our data sources. Let's use the best, vetted packages and libraries. And let's structure our repository in a sensible way that's clean, light weight, easy to navigate.

It's important that, for every official analysis we host (merged to Master branch), we make it easy to understand what was done, and make it easy to repeat analyses to get identical results. That means explaining the data: where it came from, what all the variables mean, how to get the data. Explaining how the data was cleaned up and transformed, and how datasets were merged. It also means explaining the packages that were used, and how to get them (this is really important if they're not popular cran or pip packages).

## Data<a name="data"></a>
### Storage and downloading<a name="storage_downloading"></a>
Because of the size of the datasets we're analysing, and because they may be repeatedly updated, we won't store them in the main repository. We will download them, on an as-needed basis, into users' `./localdata` folders. Note that `gitignore` is set to ignore the contents of `./localdata`. All analyses should access the data files in `./localdata/*` by relative path. Filenames and version names should be consistent across analyses. We can either host the files on github, or download them from the original source.

### Descriptions<a name="data_readmes"></a>
Every dataset should be described so that their contents, their purpose, and their provenance are clear. 
* Raw datasets, to be downloaded from an external source, should have be given descriptions of the date they were accessed, the url, and other pertinent metadata. 
* Intermediate datasets, produced by merging, or transforming, or cleaning up data, should be described.
* Final datasets, on which the analyses are conducted, should be described in full. With column-by-column descriptions of each variable.

It might be a good idea to have separate scripts for the data manipulation and data analysis/visualisation steps.

### Formats<a name="data_formats"></a>
Tabular data should be:
* `.csv`. Comma delimited, double quote text delimiters. Alternative plain text formats are probably fine (`tsv`, `ssv`)
* `utf8` (this should be strongly enforced)
* a single table per sheet (no sheets with multiple tables)
* No empty lines
* use 'NaN' or 'NA' to indicate missing data

`json` is probably better than `xml`, if we have a choice (open for discussion).

## Documentation and Style<a name="documentation"></a>
Yeah yeah. Everyone agrees that code needs to be documented. And everyone says they're going to do it. But we never document to the level we aspire. Documentation is a pain, it sometimes feels like a distraction. 

### Comments<a name="documentation_comments"></a>
Please comment your code, as fully as possible. Within sane limits.
* for functions, explain what arguments the function takes, the value it returns, and what the general purpose of the function is.
* for procedural analyses (e.g. most R analyses) please lay out the work flow.
* use descriptive variable names, that don't repeat, as the best kind of comment.

### Readmes<a name="documentation_readmes"></a>
The readmes should be in markdown (`.md`) format. At a minimum, a readme needs to describe the data and its provenance in detail. It needs to describe all files, including code. It should explain the broad methods used, in cleaning, merging, and analysing data. And it should explain the major conclusions.

Please use correct headings and document structure. Variable names, and single line code samples, should be flanked with "\`", the backtick code delimiter. Code blocks should be fenced in with three code tick format. [There are plenty of cheatsheets available](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet). The emphasis here is on readablity, clarity, and consistency. We're not necessarily trying to enforce any one style.

### Style<a name="documentation_style"></a>
Pick a style and stick with it, within an analysis. 
* camel case OR underscores
* consistent use of capitalisation for functions, variables, and classes
* it would be really nice if Python analyses tried to [adhere to to Pep 8](https://www.python.org/dev/peps/pep-0008/)

## To Do<a name="to_do"></a>
Let's keep a list of open topics that we'd really like to work on, ranging from apis and data processing tasks, to research problems.

### Data Curation<a name="data_curation"></a>
* figure out the American Community Survey data model and api.
  * `./Data_Sources/acs_data_parsing`
  * priority med
  
### Open Research<a name="open_research"></a>
