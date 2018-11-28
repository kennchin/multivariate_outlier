# Multivariate Outlier Detection Based on Robust Methods   
[Click for demo app](https://kechin.shinyapps.io/mvoutlier_own/) (**Note**:see below for details)
- This project uses the idea of Multivariate Outlier Detection Based on Robust Methods by Peter Filzmoser and Moritz Gschwandtner in the mvoutlier package. 
- The basic idea of outlier detection is as follow:
1) A dataset with at least three variables is transformed using the isometric log ratio (ilr)
2) Robust location and covariance estimation are derived using the adaptive approach for computing the mahalanobis distance to determine regular observations and outliers.
3) The robust mahalanobis distance is split by four values:0.25(blue),0.50,0.75,0.975(red)   

I decided to modify some of the plots in the package for the following reasons:
1) The number in the plot it's not random because they will represent the observation in the dataset
2) Use ggplot to produce nicer visual

# Example using dataset humus from mvoutlier package for comparison purpose:

Original Biplot
![Original_bi](/images/bi_orig.png)   
Modified Biplot
![own_bi](/images/bi_own.png)

Original Uniplot
![Original](/images/uni_orig.png)   
Modified Uniplot
![Own](/images/uni_own.png)

Original Parallel Plot
![Original_par](/images/par_orig.png)   
Modified Parallel Plot
![mod_par](/images/par_own.png)

# Putting it all together in an app to explore outliers:
[Click for demo app](https://kechin.shinyapps.io/mvoutlier_own/)

Screenshot
![Demo](/images/demos2.PNG)

- Dataset:
  - A data frame with 617 observations on the following 44 variables that represent the different humus layer.
#The Kola Data were collected in the Kola Project (1993-1998, Geological Surveys of Finland (GTK) and Norway (NGU) and Central Kola Expedition (CKE), Russia)   
- Color Definition:
  1) Green and yellow are consider to be moderate outlier
  2) Red are consider to be observations that is greater than 97.5 percentile (extreme outliers)

- Ways to find outlier:
  - There are two ways to detect the extreme outlier by using the upper graphs: 
    1) Selecting with red points with cursor(upper left figure) and the information is provided below (lower left figure)
    2) Look at the parallel plot for odd pattern(red lines in upper right figure) and look at the information in the lower right table.

- Example:
  - Point 28 in both graph(upper left and upper right) show that this point is dominant in both Ni and Cu (high values). We can confirm this finding if we look at the actual value for observation 28(Cu: 2450,Ni: 1220 which is above the mean of respective columns)







