#' This is some description of this function
#' @title costFunction
#' @description It is used to calculate the costFunction of the logistic regression
#' @details  You can use this function to calculate costFunction, Jaccobi Matrix, and Hessian Matrix of the model
#' @param beta  beta is a matrix
#' @param X X is a dataframe, it is the attribute of the data set
#' @param y y is a dataframe, it is the label of the data set
#' @return a number
#' @export
#' @example costFunction(beta, X, y)
#'
#'

costFunction <- function(beta, X, y){
  cost <- - X %*% beta * y + log(1 + exp(X %*% beta))
  return(sum(cost))
}
#miu, Jaccobi, Hessian
miu <- function(beta, X){
  return(1 / (1 + exp(- X %*% beta)))
}
Jacobbi <- function(beta, X, y){
  return(t(X) %*% as.matrix((miu(beta, X) - y)))
}
Hessian <- function(beta, X){
  x_shape = dim(X)[1]
  S <- matrix(0, nrow = x_shape, ncol = x_shape)
  for (i in 1:x_shape){
    miu_i <- miu(beta, X)[i]
    S[i,i] <- miu_i * (1 - miu_i)
  }
  return(t(X) %*% (S %*% X))
}
