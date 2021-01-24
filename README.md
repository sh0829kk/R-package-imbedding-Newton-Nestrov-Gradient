***Logistic Regression***

:sparkles:  Author: Keke Lin

**TestLogistic.Rmd and TestLogistic.r are demo code sample of the package.**   

*Performs discrete, real, and gentle logistic regression model under both initial model and model with L2 norm regularization*.

:octocat:

 **1. Import Dataset**

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
      
- Regard 2nd-10th columns as independent variables $X$ while 11th column as the dependent variable $y$. To simplify the notation of the dependent varibale, I denoted original dependent value $2$ as $1$ and $4$ as $2$, hence $y\in \{0,1\}$.)     

- I added offset column $O_{n\times 1}$ on the independent matrix $X$.        

- To import data, please use command **data("breast-cancer-wisconsin")**.    

**2. Parameter Initialization**

   * maxLength = 10000, modification allowed.     
        *Maximum iteration length.*

   * Learning rate = 0.001, modification allowed.
   
   * sigma = 0.001,  modification allowed.            
  
        *threshold: Stop calculation if sigma number of iterations is reached.*

   * regulation = 0 for initial model, regulation = 2 for L2 norm regularization model.

* lambda = 0.5, as the coefficient of norm regularization.

**3. Select Learning models**

   * Newton
   * Gradient Descent
   * Nestrov Gradient Descent
   
**4. Output params and pics**
   
   Output is a list comprising elements $\{beta, iList, costList\}$, where $iList$ is iteration.No, $costList$ is the cost function.      

   Embedded function *plotAUC* and *Confusion Matrix* return the result of K-fold cross-validation based on the validation set.

![Compare Plots](/000013.png)
