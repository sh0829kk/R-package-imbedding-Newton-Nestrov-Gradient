#'This is some description of this function
#'@title ConfusionMatrix
#'@description It can output the ConfusionMatrix of the model
#'@details You can use this function to output the ConfusionMatrix, accuracy, precision score, recall and F1 of the model.
#'@param beta beta is a matrix
#'@param X X is a dataframe
#'@param y y is a dataframe
#'@return a dataframe and other numeric scores
#'@export
#'@examples ConfusionMatrix(beta, X, y)
#'
#'
ConfusionMatrix <- function(beta, X, y){
  sigmd <- miu(beta, X)
  pre <- vector()
  for(i in sigmd){
    if(i >= 0.5){
      pre <- append(pre, 1)
    }else{
      pre <- append(pre, 0)
    }
  }
  ConfusionMatrix <- matrix(0, nrow = 2, ncol = 2)
  for(i in 1:length(pre)){
    if(pre[i] == y[[1]][i]){
      if(pre[i] == 1){
        ConfusionMatrix[1,1] <- ConfusionMatrix[1,1] + 1
      }else{
        ConfusionMatrix[2,2] <- ConfusionMatrix[2,2] + 1
      }
    }else{
      if(pre[i] == 1){
        ConfusionMatrix[1,2] <- ConfusionMatrix[1,2] + 1
      }else{
        ConfusionMatrix[2,1] <- ConfusionMatrix[2,1] + 1
      }
    }
  }
  accuracy <- (ConfusionMatrix[1,1] + ConfusionMatrix[2,2])/(sum(ConfusionMatrix))
  precision <- ConfusionMatrix[1,1]/sum(ConfusionMatrix[1,])
  recall <- ConfusionMatrix[1,1]/sum(ConfusionMatrix[,1])
  F1 <- 2 * precision * recall / (precision + recall)
  ConfusionMatrix <- data.frame(ConfusionMatrix)
  names(ConfusionMatrix) <- c("Actual.True","Actual.False")
  row.names(ConfusionMatrix) <- c("Predicted.True", "Predicted.False")
  output <- list(ConfusionMatrix = ConfusionMatrix, accuracy = accuracy, precision =
                   precision, recall = recall, F1 = F1)
  return(output)
}
