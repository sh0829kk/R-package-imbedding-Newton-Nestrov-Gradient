#' This is some description of this function
#' @title GradientDescent
#' @description It is used to perform the GradientDescent model.
#' @details You can choose whether to add regularization to the model, by setting default regulation 0 to 2,
#'          which means you adopt, GradientDescent model with L2 norm regulation term.
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
#' @example Gradient(beta, X, y)




GradientDescent <- function(beta, X, y,
                            maxLength = 10000, learningRate = 0.001, sigma = 0.001,
                            regulation = 0, lamda = 0.5){
  iList <- list()
  costList <- list()
  for (i in 1:maxLength){
    if(regulation == 2){
      cost <- costFunction(beta, X, y) + 0.5 * (t(beta) %*% beta)
      grad <- Jacobbi(beta, X, y) + 2 * 0.5 * sum(beta)
    }else{
      cost <- costFunction(beta, X, y)
      grad <- Jacobbi(beta, X, y)
    }
    grad_length <- sqrt(sum((grad)^2))
    if(grad_length < sigma){
      print("END!!!")
      output <- list(beta = beta, iList = iList, costList = costList)
      return(output)
    }
    beta <- beta - learningRate * grad
    iList <- append(iList, i)
    costList <- append(costList, cost)
  }
  return(beta)
}
