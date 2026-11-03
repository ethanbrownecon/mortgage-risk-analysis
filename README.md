# Mortgage Risk Indicators and Borrower Characteristics

An applied econometrics project from ECO 420, Econometrics, Berry College, Spring 2025.

## Question

How do risky mortgage features vary across borrower groups, and do the differences remain after accounting for credit score, age, education, and neighborhood income?

## Why it matters

Features such as high loan to value ratios, heavy debt burdens, and low credit scores affect both default risk and household financial strain. Looking at who holds them is a first step toward understanding how mortgage risk is distributed across borrowers.

## Data

The National Survey of Mortgage Originations (NSMO) public use file, limited to 30 year loans of a single loan type. The file is not included. Download it from its official provider and save it as `data/NSMO_PUF.dta`.

## Method

`Projectdofile.do` builds seven risk indicators: adjustable rate, balloon payment, rate spread above 1.5, combined loan to value above 90, debt to income above 43, payment to income above 31, and credit score below 620. A loan is coded high risk when it has at least two of these. `ProjectWork.do` then reports descriptive statistics, graphs, correlations, and linear regression models of balloon payments and high risk status on race, credit score, age, sex, education, and neighborhood income, including race by age and race by education interactions.

## Limitations

The results are observational and should not be read as causal or as lending advice. The high risk cutoffs are simplifying choices.

## Run

Install the `outreg2` package (`ssc install outreg2`), then from the repository root in Stata:

```stata
do Projectdofile.do
do ProjectWork.do
```

Run the scripts in this order. Generated datasets, graphs, and tables are created locally and are not tracked.
