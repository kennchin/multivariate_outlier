plot_uni <- function(x)
{

  s <- x$outliers
  ilr.df = as.data.frame(x$ilrvariables)
  ilr.out = ilr.df[s,]
  Zj <- x$ilrvariables[s,]
  colv <- x$colcol
  par(mfrow = c(1, ncol(Zj)), mai = c(0.6, 0.15, 0.6, 0.15), oma = c(0, 3, 0, 3))

  for (i in 1:ncol(Zj)) {
    plot(runif(nrow(Zj), min = -1, max = 1), Zj[,i],
       main = paste("ilr(",dimnames(Zj)[[2]][i],")",sep=""), xlim = c(-1.5, 1.5),
       xlab = "",ylab="ilr-variables",xaxt = "n", col = colv[s],type="n")
    text(runif(nrow(Zj), min = -1, max = 1), Zj[,i], labels=rownames(ilr.out),
       col = colv[s])
  }
}