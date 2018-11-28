plot_bi <-function(x)
{
  pca <- x$pcaobj$princompOutputClr
  choice=1:2
  sel <- x$outliers
  pca.scores.df = as.data.frame(pca$scores)
  pca.outliers = pca.scores.df[sel,choice]
  names = rownames(pca.outliers)
  #col.quantile = c(0,0.05, 0.1, 0.5, 0.9, 0.95, 1)
  
  colcol <- x$colcol 
  choicePC=choice
  eval = x$pcaobj$eigenvalues
  xperc <- eval[choicePC[1]]/sum(eval)*100
  yperc <- eval[choicePC[2]]/sum(eval)*100
  xaxlab <- paste("PC",choicePC[1]," (",round(xperc,1),"%)",sep="")
  yaxlab <- paste("PC",choicePC[2]," (",round(yperc,1),"%)",sep="")
  
  pca.loadings =as.data.frame(pca$loadings[,choice])
  
  
   ggplot(pca.outliers, aes(x = Comp.1, y = Comp.2)) + geom_point(color=colcol[sel], size = 10, alpha = 0.3)+
    geom_text(aes(label=names),hjust=0.5, vjust=0.5)+labs(x=xaxlab,y=yaxlab)+geom_segment(data = pca.loadings,aes(x = 0, y = 0, xend = pca.loadings[,1]*1.2, yend = pca.loadings[,2]*1.2),arrow = arrow(length = unit(1/2, 'picas')), 
                                                                                        color = 'red')+geom_label(data=pca.loadings, aes(x= pca.loadings[,1]*1.3,y=pca.loadings[,2]*1.3,label=rownames(pca.loadings)), size=4)

   
}