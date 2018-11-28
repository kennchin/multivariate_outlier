plot_parallel <-function(x)
{

    parcoordmy <- function (x, col = 1, lty = 1, var.label = FALSE, overplot = FALSE, subset=NULL, colsub=1, ltysub=1, ...) {
      # overplot=TRUE allows to again plot a subset of the data defined by the outliers
      rx <- apply(x, 2L, range, na.rm = TRUE)
      x <- apply(x, 2L, function(x) (x - min(x, na.rm = TRUE))/(max(x,
                                                                    na.rm = TRUE) - min(x, na.rm = TRUE)))
      matplot(1L:ncol(x), t(x), type = "l", col = col, lty = lty,
              xlab = "", axes = FALSE, ...)
      if (overplot){matlines(1L:ncol(x), t(x[subset,]),type = "l", col = colsub, lty = ltysub)}
      axis(1, at = 1L:ncol(x), labels = paste("ilr(",colnames(x),")",sep=""))
      for (i in 1L:ncol(x)) {
        lines(c(i, i), c(0, 1), col = "grey70")
        if (var.label)
          text(c(i, i), c(0, 1), labels = format(rx[, i], digits = 3),
               xpd = NA, offset = 0.3, pos = c(1, 3), cex = 0.7)
      }
      return(xnormed=x)
    }
    
    
    s <- x$outliers
    Zj <- x$ilrvariables[s,]
    colv <- x$colcol
    ilr.df = as.data.frame(x$ilrvariables)
    ilr.out = ilr.df[s,]
    transp=1
    colv <- x$colcol
    tr <- format(as.hexmode(round(transp*255)),width=2,upper.case=TRUE)
    colv[!is.na(colv)] <- paste(substr(colv[!is.na(colv)],1,7),tr,sep="")
    
    pchvec <- rownames(ilr.out)
    
    ret = parcoordmy(Zj,ylab="", col = colv[s])
    
    mtext(text=pchvec,side=2,line=runif(nrow(ret),-1.5,1.5),
          at=ret[,1],col = colv[s],las=1,cex=0.7)
    mtext(text=pchvec,side=4,line=runif(nrow(ret),-1.5,1.5),
          at=ret[,ncol(ret)],col = colv[s],las=1,cex=0.7)
    
}