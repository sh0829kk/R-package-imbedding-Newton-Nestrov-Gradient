# Logistic Regression

:sparkles:  Author: Keke Lin


*Performs discrete, real, and gentle logistic regression model under both initial model and model with L2 norm regularization*.

:octocat:

This repository contains:

1. The demo code sample 1 [TestLogistic.Rmd](TestLogistic.Rmd) and the demo code sample 2 [TestLogistic.r](TestLogistic.r) to show how the package can be used.
2. A data file [data](data) to restore the built-in data set.
3. A R function file [R](R) to perform the different functions of the package.
4. A compressed package [LogisticRegression_0.1.1.tar.gz](LogisticRegression_0.1.1.tar.gz) to download the source package.


## Table of Contents

- [Import Dataset](#Import Dataset)
- [Install](#install)
- [Usage](#usage)
	- [Generator](#generator)
- [Badge](#badge)
- [Example Readmes](#example-readmes)
- [Related Efforts](#related-efforts)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

 ## Import Dataset

   * The data about breast cancer was obtained from University of Winsconsin Hospitals, Madison from Dr. William H. Wolberg.
   * Attributes and class are displayed in following table,
   
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

- I have modified abnormal data by KNN imputation method and transfered all data into **numeric** type.     
      
- Regard 2nd-10th columns as independent variables $X$ while 11th column as the dependent variable $y$. To simplify the notation of the dependent varibale, I denoted original dependent value $2$ as $1$ and $4$ as $2$, hence $y\in \{0,1\}$.    

- I added offset column $O_{n\times 1}$ on the independent matrix $X$.        

- To import data, please use command **data("breast-cancer-wisconsin")**.    

## Parameter Initialization

   * maxLength = 10000, modification allowed.     
        *Maximum iteration length.*


   * Learning rate = 0.001, modification allowed.
   
   
   * sigma = 0.001,  modification allowed.            
  
        *threshold: Stop calculation if sigma number of iterations is reached.*


   * regulation = 0 for initial model, regulation = 2 for L2 norm regularization model.


   * lambda = 0.5, as the coefficient of norm regularization.

## Select Learning models

### Newton
### Gradient Descent
### Nestrov Gradient Descent
   
## Output params and pics
   
   Output is a list comprising elements $\{beta, iList, costList\}$, where $iList$ is iteration.No, $costList$ is the cost function.      

   Embedded function *plotAUC* and *Confusion Matrix* could return the result of K-fold cross-validation based on the validation set.

![Compare Plots](/000013.png)
