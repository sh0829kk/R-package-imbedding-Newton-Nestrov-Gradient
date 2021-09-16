#' This is some description of this function
#' @title plotAUC
#' @description It is a function used to plot the ROC curve of the model
#' @details You can use this function to plot the ROC curve and output the value of
#'          AUC by simply input the value of beta, X and y.
#' @param beta  beta is a matrix
#' @param X X is a dataframe, it is the attribute of the data set
#' @param y y is a dataframe, it is the label of the data set
#' @return a number and plot ROC curve
#' @export
#' @example plotAUC(beta, X, y)
#'





plotAUC <- function(beta, X, y){
  sigmd <- miu(beta, X)
  require(ROCR)
  if(!require(ROCR)) install.packages("ROCR")
  library(ROCR)
  sigmd <- miu(beta, X)
  pred <- prediction(sigmd, y)
  performance <- performance(pred, 'auc')@y.values
  perf <- performance(pred,'tpr','fpr')
  plot(perf)
  return(performance)
}
