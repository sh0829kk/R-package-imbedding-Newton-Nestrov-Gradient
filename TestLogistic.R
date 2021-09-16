
# title: "TestLogistic"
# author: "Lin Keke"
# date: "1/21/2021"


#Import packages and data
library(LogisticRegression)
data("breast-cancer-wisconsin")
head(datas,20)

###Data Cleaning
X_data <- datas[2:10]
Y_data <- datas[11]
X_norm <- scale(X_data)
dim(X_norm)
dim(Y_data)
#Add offset to X
X <- cbind(X_norm, 1)
y <- Y_data
#transform y into {0,1}
y[[1]][which(y == 2)] <- 1
y[[1]][which(y != 1)] <- 0


###Test Models
##Test GradientDescent
#Initial Model
set.seed(1)
beta_grad <- as.matrix(rnorm(dim(X)[2])) * 0.01#initialize beta
output_grad1 <- GradientDescent(beta_grad, X, y)#output

beta_grad1 <- output_grad1$beta
iteration.No1.1 <- output_grad1$iList
costList1.1 <- output_grad1$costList

print(beta_grad1)#print output
print(ConfusionMatrix(beta_grad1, X,y))
print(plotAUC(beta_grad1, X, y))

#L2-regulation Model
output_grad2 <- GradientDescent(beta_grad, X, y, regulation = 2)#output

beta_grad2 <- output_grad2$beta
iteration.No1.2 <- output_grad2$iList
costList1.2 <- output_grad2$costList

print(beta_grad2[,1])
print(ConfusionMatrix(beta_grad2, X, y))
print(plotAUC(beta_grad2, X, y))



##Test Newton
#Initial Model
set.seed(1)
beta_nt <- as.matrix(rnorm(dim(X)[2])) * 0.01#initialize beta
output_nt1 <- Newton(beta_nt, X, y)#output

beta_nt1 <- output_nt1$beta
iteration.No2.1 <- output_nt1$iList
costList2.1 <- output_nt1$costList

print(beta_nt1)#print output
print(ConfusionMatrix(beta_nt1, X, y))
print(plotAUC(beta_nt1, X, y))

#L2-regulation Model
output_nt2 <- Newton(beta_nt, X, y, regulation = 2)#output

beta_nt2 <- output_nt2$beta
iteration.No2.2 <- output_nt2$iList
costList2.2 <- output_nt2$costList

print(beta_nt2)#print output
print(ConfusionMatrix(beta_nt2, X, y))
print(plotAUC(beta_nt2, X, y))



##Test NestrovGradientDescent
#initial Model
set.seed(1)
beta_gradNes <- (rnorm(dim(X)[2])) * 0.01#initialize beta
output_gradNes1 <- NestrovGradientDescent(beta_gradNes, X, y)#output

beta_gradNes1 <- output_gradNes1$beta
iteration.No3.1 <- output_gradNes1$iList
costList3.1 <- output_gradNes1$costList

print(beta_gradNes1)#print output
print(ConfusionMatrix(beta_gradNes1, X, y))
print(plotAUC(beta_gradNes1, X, y))

#L2-regulation Model
output_gradNes2 <- NestrovGradientDescent(beta_gradNes, X, y ,regulation = 2)#output

beta_gradNes2 <- output_gradNes2$beta
iteration.No3.2 <- output_gradNes2$iList
costList3.2 <- output_gradNes2$costList

print(beta_gradNes2)#print output
print(ConfusionMatrix(beta_gradNes2, X, y))
print(plotAUC(beta_gradNes2, X, y))

###Plot the final output
plot(c(1,50),c(50,500), type = "n", xlab = "Iteration.No", ylab = "CostFunc")
abline(h = seq(50,500, by = 20), v = 0:50, col = "lightgray", lty = 3)
lines(iteration.No1.1, costList1.1, col = "red1")
lines(iteration.No1.2, costList1.2, col = "red4")
lines(iteration.No2.1, costList2.1, col = "blue1")
lines(iteration.No2.1, costList2.1, col = "blue4")
lines(iteration.No3.1, costList3.1, col = "yellow1")
lines(iteration.No3.2, costList3.2, col = "yellow4")

legend("topright",                                    #Legend loc
       legend=c("Gradient", "Gradient-L2", "Newton", "Newton-L2", "NestrovGradient", "NestrovGradient-L2"),        #Legend contents
       col=c("red1","red4", "blue1", "blue4", "yellow1", "yellow4"),                 #Legend color
       lty=1,lwd=2)                                          #Legend size



