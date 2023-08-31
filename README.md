# R_Package_Remove_Outliers
## Download on R using _devtools::install_github("jckober5/R_Package_Remove_Outliers/jkoutliers")_
R package used to help remove outliers from a data frame.
An outlier is an observation that lies abnormally far away from other values in a dataset. Outliers can be problematic because they can affect the results of an analysis.

This Package helps to identify and remove outliers in R.

## How to Identify Outliers in R
Before you can remove outliers, you must first decide on what you consider to be an outlier. There are two common ways to do so:

## 1. Use the interquartile range.

The interquartile range (IQR) is the difference between the 75th percentile (Q3) and the 25th percentile (Q1) in a dataset. It measures the spread of the middle 50% of values.

You could define an observation to be an outlier if it is 1.5 times the interquartile range greater than the third quartile (Q3) or 1.5 times the interquartile range less than the first quartile (Q1).

Outliers = Observations > Q3 + 1.5*IQR  or < Q1 – 1.5*IQR

## 2. Use z-scores.

A z-score tells you how many standard deviations a given value is from the mean. We use the following formula to calculate a z-score:

z = (X – μ) / σ

where:

X is a single raw data value
μ is the population mean
σ is the population standard deviation
You could define an observation to be an outlier if it has a z-score less than -3 or greater than 3.

Outliers = Observations with z-scores > 3 or < -3
