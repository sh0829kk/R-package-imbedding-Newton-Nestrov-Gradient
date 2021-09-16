# Logistic Regression

:sparkles:  Author: Keke Lin


*Performs discrete, real, and gentle logistic regression model under both initial model and model with L2 norm regularization*.

:octocat:

This repository contains:

1. The demo code sample 1 [TestLogistic.Rmd](TestLogistic.Rmd) and the demo code sample 2 [TestLogistic.R](TestLogistic.R) to show how the package can be used.
2. A data file [data](data) to restore the built-in data set.
3. A R function file [R](R) to perform the different functions of the package.
4. A compressed package [LogisticRegression_0.1.0.tar.gz](LogisticRegression_0.1.0.tar.gz) to download the source package.


## Table of Contents
- [Import Dataset](#import-dataset)
- [Parameter Initialization](#parameter-initialization)
- [Select Learning models](#select-learning-models)
  * [Newton](#newton)
  * [Gradient Descent](#gradient-descent)
  * [Nestrov Gradient Descent](#nestrov-gradient-descent)
- [Output params and pics](#output-params-and-pics)


  


 ## Import Dataset

 - The data about breast cancer was obtained from University of Winsconsin Hospitals, Madison from Dr. William H. Wolberg.
 -  Attributes and class are displayed in following table,
   
   |Sample Code Number | id number|
   |:-----------------:|:---------|
   |Clump thickness    | 1-10     |
   |Uniformity of Cell Size| 1-10|
   |Uniformity of Cell Shape | 1-10|
   |Marginal Adhesion | 1-10|
   |Single Epithelial Cell Size | 1-10|
   |Bare Nuclei | 1-10|
   |Bland Chromatin | 1-10|
   |Normal Nucleoli| 1-10|
   |Class:|(2 for benign, 4 for maligant)

- All abnormal datas are modified by KNN imputation method and transfered  into **numeric** type.     
      
- Regard 2nd-10th columns as independent variables <img src="https://render.githubusercontent.com/render/math?math=%24X%24"> while 11th column as the dependent variable <img src="https://render.githubusercontent.com/render/math?math=%24y%24">. 

- To simplify the notation of the dependent varibale <img src="https://render.githubusercontent.com/render/math?math=%24y%24">, original  value <img src="https://render.githubusercontent.com/render/math?math=%242%24"> is taken as <img src="https://render.githubusercontent.com/render/math?math=%240%24"> and <img src="https://render.githubusercontent.com/render/math?math=%244%24"> as <img src="https://render.githubusercontent.com/render/math?math=%241%24">, hence <img src="https://render.githubusercontent.com/render/math?math=%24y%5Cin%20%5C%7B0%2C1%5C%7D%24">.    

- Added offset column <img src="https://render.githubusercontent.com/render/math?math=%24O_%7Bn%5Ctimes%201%7D%24"> on the independent matrix <img src="https://render.githubusercontent.com/render/math?math=%24X%24">.        

- To import data, please use following command in R console:
```r
data("breast-cancer-wisconsin")
```
## Parameter Initialization

   * **maxLength** = 10000  
 >Maximum iteration length. Modification allowed.


   * **Learning rate** = 0.001 
  >Model learning rate. Modification allowed.
   
   
   * **sigma** = 0.001  
   >Threshold: stop calculaion if sigma number of iteration is reached. Modification allowed.        

   * **regularization** 
   >= 0 for initial model, = 2 for L2 norm regularization model.


   * **lambda** = 0.5 
   >Coefficient of norm regularization. Modification allowed.

## Select Learning models

### Newton
  
  The basic idea of Newton's method is to use the first derivative (gradient) and second derivative (Hesssen matrix) at the iteration point to approximate the objective function with the quadratic function, and then use the minimum point of the quadratic model as the new iteration point.
  
### Gradient Descent
   To use the gradient descent method to find the local minimum of a function, it is necessary to iteratively search for the specified step distance point in the opposite direction of the gradient (or approximate gradient) corresponding to the current point on the function.
### Nestrov Gradient Descent
   Nesterov Accelerated Gradient algorithm is improved over Momentum in that it is updated with the gradient seen "looking forward" instead of the current position gradient. In the equivalent form after transformation, the NAG algorithm has one more change from the current gradient to the last gradient relative to Momentum. This change is essentially an approximation of the second derivative of the objective function. Due to the use of the second-order derivative information, the NAG algorithm has a faster convergence rate than Momentum.
   
## Output params and pics
   
   * Output is a list comprising elements <img src="https://render.githubusercontent.com/render/math?math=%24%5C%7Bbeta%2C%20iList%2C%20costList%5C%7D%24">, where <img src="https://render.githubusercontent.com/render/math?math=%24iList%24"> is iteration.No, <img src="https://render.githubusercontent.com/render/math?math=%24costList%24"> is the cost function.      

   * Embedded function *plotAUC* and *Confusion Matrix* could return the result of K-fold cross-validation based on the validation set.

![Compare Plots](/000013.png)
