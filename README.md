# Statistics_And_R
### 1. Deliverable 1: Linear Regression to Predict MPG

![Screen Shot 2022-02-10 at 11 24 14 PM](https://user-images.githubusercontent.com/69704963/153803031-b4610647-03d4-41a0-98d1-d550e36fb6fb.png)

Q1. Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

A1. Using the MechaCar_mpg dataset, vehicle length and
    ground_clearance (as well as intercept) are statistically unlikely to provide
    random amounts of variance to the linear model. In other words, Looking at the statistical data we see that vehicle_length and ground_clearance have a significant impact on the mpg   

Q2. Is the slope of the linear model considered to be zero? Why or
    why not?
    Methodology: Examine the Pr(›||) value in the summary above for
    the (Intercept).

A2. **The intercept is statistically significant** (less than
    the 0.05) **and not zero**.
    This would indicate that the intercept
    term explains a significant amount of variability in the dependent
    variable when all independent variables are equal to zero. It could
    mean that the significant features (such as vehicle weight and
    ground_clearance) may need scaling or transforming to help improve
    the predictive power of the model; or there are other variables that
    can help explain the variability of our dependent variable (mpg)
    that have not been included in our model
    ?


Q3 Does this linear model predict mpg of MechaCar prototypes
    effectively? Why or why not?
    - Methodology: Examine the Multiple R-squared value to indicate
    how well the regression model approximates real-world data points
    In most cases, the value will range between e and 1 Tid can be
    used as a probability metric to determine the likelihood that
    future data points will fit the model.

A3: **The Multiple R-squared value is 0.71** (while the p-value
    remained significant (very small) **indicating the model does an
    adequate job of predicting mpg**




### 2. Deliverable 2: Summary Statistics on Suspension Coils

<img width="275" alt="Screen Shot 2022-02-13 at 10 46 59 PM" src="https://user-images.githubusercontent.com/69704963/153803126-69da1a95-81bc-4c08-a18e-3368208aec18.png">

   
Q1. The design specifications for the MechaCar suspension coils dictate that the
    variance of the suspension coils must not exceed 100 pounds per square inch.
    Does the current manufacturing data meet this design specification for all
    manufacturing lots in total and each lot individually? Why or why not?
Methodology: Examine the mean, median and variance in total
    (total_summary) and for each lot (lot summary) to determine if the variance
    is within the 100 pounds per square inch.
    
A1: **In total the specification are met with variance of 62.29 (less than
    100).**
    
A2: **By Lots, Lots 1 & 2 are within specifications; however Lot 3 has a
    variance that exceeds specifications (100 PSI).**


### 3. Deliverable 3: T-Test on Suspension Coils

Q1. **Are all manufacturing lots(and each lot indicidually) statistically different from the poulation mean of 1,500 pounds per square inch.** 
 
 Methodology (all manufacturing lots): Perform a .test using PSI and mu of 1500 and evaluate the resulting p-value for significance using a .05 level of
 
A1.  **All Lots are NOT significantly different from the population mean (with a p-value 0f 0.060)**

<img width="403" alt="Screen Shot 2022-02-13 at 11 36 57 PM" src="https://user-images.githubusercontent.com/69704963/153803312-de423dcc-c8b6-446f-ae11-c393fa540cbb.png">


 
 **Lot 1 is NOT sginificantly different from the population mean (with a p-value of 1)**
 
 <img width="554" alt="Screen Shot 2022-02-13 at 11 37 14 PM" src="https://user-images.githubusercontent.com/69704963/153988171-6e19a0d7-6035-41cf-8235-ce5c9b934abc.png">
 
 **Lot 2 is NOT significantly different from the population mean (with a p-value of 0.61)**
 <img width="549" alt="Screen Shot 2022-02-13 at 11 37 30 PM" src="https://user-images.githubusercontent.com/69704963/153989029-00679b6d-f7c6-40d8-a95b-936f3a367750.png">

**Lot 3 IS significantly different from the population mean (with a p-value of 0.042)**

<img width="543" alt="Screen Shot 2022-02-13 at 11 37 47 PM" src="https://user-images.githubusercontent.com/69704963/153989168-bd0789fe-af39-43c9-982a-e2f589a21bd2.png">

 
4. Deliverable 4: Design a Study Comparing the MechaCar to the Competition

N/A
