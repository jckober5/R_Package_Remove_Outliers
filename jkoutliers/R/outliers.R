#' Remove Outliers using the IQR Method
#'
#' @param dataframe The chosen data frame being used for study
#' @param column The chosen column used to analyze and reduce potential outliers
#'
#' @return The dataframe argument with observation outliers from the requested column removed
#' @export
#'
#' @examples quantileRemove(mtcars,'mpg')
quantileRemove <- function(dataframe, column){
  # find Q1, Q3, and interquartile range for values in the column listed
  Q1 <- quantile(dataframe[ , column], .25)
  Q3 <- quantile(dataframe[ , column], .75)
  IQR <- IQR(dataframe[ , column])
  # Remove rows from the data frame that have a value in the column that is 1.5 times the interquartile range greater than the third quartile (Q3) or 1.5 times the interquartile range less than the first quartile (Q1)
  noOutliers <- subset(dataframe, dataframe[ , column] > (Q1-1.5*IQR)
                       & dataframe[ , column] < (Q1+1.5*IQR))
  return(noOutliers)
}

#' Minimum Quantile Value
#'
#' @param dataframe The chosen data frame being used for study
#' @param column The chosen column used to analyze and reduce potential outliers
#'
#' @return the Quantile value at .25
#' @export
#'
#' @examples minQuantileValue(mtcars, 'mpg')
minQuantileValue <- function(dataframe, column){
  Q1 <- quantile(dataframe[ , column], .25)
  return(Q1)
}

#' Maximum Quantile Value
#'
#' @param dataframe The chosen data frame being used for study
#' @param column The chosen column used to analyze and reduce potential outliers
#'
#' @return the Quantile value at .75
#' @export
#'
#' @examples maxQuantileValue(mtcars, 'mpg')
maxQuantileValue <- function(dataframe, column){
  Q3 <- quantile(dataframe[ , column], .75)
  return(Q3)
}

#' Inter Quartile Range Value
#'
#' @param dataframe The chosen data frame being used for study
#' @param column The chosen column used to analyze and reduce potential outliers
#'
#' @return the Inter Quartile Range Value
#' @export
#'
#' @examples IQRange(mtcars, 'mpg')
IQRange <- function(dataframe, column){
  IQR <- IQR(dataframe[ , column])
  return(IQR)
}

#' Remove the Outliers using the Z-score method
#'
#' @param dataframe The chosen data frame being used for study
#' @param column The chosen column used to analyze and reduce potential outliers
#'
#' @return A dataframe with observation outliers from the selected column over a z-score of 3 removed
#' @export
#'
#' @examples zScoreRemove(mtcars, 'mpg')
zScoreRemove <- function(dataframe, column){
  #find absolute value of z-score for each value in each column
  dataframe$zscores <- abs(dataframe[ , column]-mean(dataframe[ , column]))/sd(dataframe[ , column])

  #only keep rows in dataframe with all z-scores less than absolute value of 3
  noOutliers <- subset(dataframe, dataframe$zscores < 3, select = -c(zscores))
  return(noOutliers)
}
