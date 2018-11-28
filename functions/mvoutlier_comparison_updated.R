library(ggplot2)
library(mvoutlier)
library(rrcov)

#my own functions
source('./plot_uni_own.R')
source('./plot_bi_own.R')
source('./plot_parallel_own.R')

str(humus)
a=humus[ , c("Al","Cu", "Ni", "Co")]
# The mvoutlier.CoDa function returns all pertinent information needed for further analysis
data <- mvoutlier.CoDa(humus[ , c("Al","Cu", "Ni", "Co")])

#mvoutlier function
plot(data,onlyout=TRUE,which="biplot",bw=FALSE,
     symb=TRUE,symbtxt=TRUE) 

plot(data,onlyout=TRUE,which="uni",bw=FALSE,
     symb=TRUE,symbtxt=TRUE) 

plot(data,onlyout=TRUE,which="parallel",bw=FALSE,
     symb=TRUE,symbtxt=TRUE) 

#own version of plot
#1) The number represent the observation in the data
#2) Better visual with ggplot
plot_bi(data)

plot_uni(data)

plot_parallel(data)

