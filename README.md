# Multivariate Outlier Detection Based on Robust Methods   
[Click for demo app](https://kechin.shinyapps.io/mvoutlier_own/)
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
![Demo](/images/demos.png)







