# Mortgage Risk Analysis

An empirical analysis of mortgage risk indicators using the National Survey of Mortgage Originations (NSMO) public-use data. Stata scripts clean the survey data, construct loan-risk measures, and examine how those measures vary across borrower and loan characteristics.

## Project workflow

1. `Projectdofile.do` filters the source data and creates derived risk indicators, a composite risk count, and a binary high-risk measure.
2. `ProjectWork.do` produces descriptive statistics, exploratory graphs, correlations, and regression tables.

The analysis defines a high-risk loan as one with at least two of the component risk indicators. The regression and descriptive results are observational and should not be interpreted as causal or as lending recommendations.

## Data

The NSMO public-use file is not included in this repository. Obtain it from its official provider and save it as `data/NSMO_PUF.dta`. The generated `Final_Dataset.dta` is also excluded; the scripts create it locally.

## Run

Use Stata and install the `outreg2` package (for example, from Stata with `ssc install outreg2`). From the repository root, run:

```stata
do Projectdofile.do
do ProjectWork.do
```

The scripts expect to be run in this order. Generated datasets, graph files, and Word-format result tables remain local and are not tracked in the repository. No pre-generated results are included; run the scripts against the current source data to produce them.
