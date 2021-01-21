#' This is some description of this function
#' @title Newton
#' @description It is used to perform the Newton model.
#' @details You can choose whether to add regularization to the model, by setting default regulation 0 to 2,
#'          which means you adopt, Newton model with L2 norm regulation term.
#'
#'
#' @param beta  beta is a matrix
#' @param X X is a dataframe, it is the attribute of the data set
#' @param y y is a dataframe, it is the label of the data set
#'
#' @param maxLength maxLength is a default param, which means the maximum length of the iteration.
#' @param learningRate learningRate is a number
#' @param sigma sigma is the threshold set to judge the stop condition.
#' @param regulation regulation is whether to add regularization to the model.
#' @param lamda lamda is the coefficient of the regulation term.
#'
#' @return a number
#' @export
#' @example Newton(beta, X, y)
#'
#'
#'
require(pracma)
if(!require(pracma)) install.packages("pracma")
library(pracma)
require(MASS)
if(!require(MASS)) install.packages("MASS")
library(MASS)
Newton <- function(beta, X, y,
                   maxLength = 10, sigma = 0.001,
                   regulation = 0, lamda = 0.5){
  iList <- list()
  costList <- list()
  for (i in 1:maxLength){
    if(regulation == 2){
      cost <- costFunction(beta, X, y) + lamda * (t(beta) %*% beta)
      grad <- Jacobbi(beta, X, y) + 2 * lamda * sum(beta)
    }else{
      cost <- costFunction(beta, X, y)
      grad <- Jacobbi(beta, X, y)
    }
    hess <- Hessian(beta, X)
    grad_length <- sqrt(sum((grad)^2))

    if (grad_length < sigma){
      print("End!!!")
      output <- list(beta = beta, iList = iList, costList = costList)
      return(output)
    }
    #print(pinv(hess))
    #print(paste("cost after iteration",i,":" ,cost))
    beta <- beta - (pinv(hess) %*% grad)
    iList <- append(iList, i)
    costList <- append(costList, cost)
  }
  return(beta)
}
