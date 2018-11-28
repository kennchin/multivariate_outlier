library(shiny)
library(mvoutlier)
library(tidyr)
library(ggplot2)
#library(ggrepel)
library(DT)

source('./functions/plot_uni_own.R')
source('./functions/plot_parallel_own.R')
source('./functions/plot_bi_own.R')
options(max.print=999999)
# Define UI for application that draws a histogram
ui <- fluidPage(

    fluidRow(column(6,
           plotOutput("plot1", height = 500, width = "100%",
                      # Equivalent to: click = clickOpts(id = "plot_click")
                      #click = "plot1_click",
                      brush = brushOpts(
                        id = "plot1_brush"
                      )
           )),column(6,offset=1.5,plotOutput("plot3"))),
  
    fluidRow(column(6,
      h4("Brushed points"),
      verbatimTextOutput("brush_info")),
      column(6,h4("Dataset"),
             DT::dataTableOutput("mytable")
             )
  )
)
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  str(humus)
  
  
  # The mvoutlier.CoDa function returns all pertinent information needed for further analysis
  data <- mvoutlier.CoDa(humus[ , c("Al","Cu", "Ni", "Co")])
  pca <- data$pcaobj$princompOutputClr
  choice=1:2
  sel <- data$outliers
  pca.scores.df = as.data.frame(pca$scores)
  pca.outliers = pca.scores.df[sel,choice]
  names = rownames(pca.outliers)
  #col.quantile = c(0,0.05, 0.1, 0.5, 0.9, 0.95, 1)
  data$colcol
  colcol <- data$colcol 
  choicePC=choice
  eval = data$pcaobj$eigenvalues
  xperc <- eval[choicePC[1]]/sum(eval)*100
  yperc <- eval[choicePC[2]]/sum(eval)*100
  xaxlab <- paste("PC",choicePC[1]," (",round(xperc,1),"%)",sep="")
  yaxlab <- paste("PC",choicePC[2]," (",round(yperc,1),"%)",sep="")
  
  pca.loadings =as.data.frame(pca$loadings[,choice])
  
  # pca_groups2 = cbind(pca.outliers,AE.project[sel])
  
  # #for plotting points
    a = cbind(humus[ sel, c("Al","Cu", "Ni", "Co")],pca.outliers)
    b = a
  #  
  # #renaming column names for graphing purpose
  #  Projects = factor(pca_groups2$`AE.project[sel]`)
   #names(pca.outliers) = gsub("Comp","PC",names(pca.outliers))
  
  output$plot1 <- renderPlot({
    ## grouping 
    plot_bi(data)
    
  })
  
  output$brush_info <- renderPrint({
    # Because it's a ggplot2, we don't need to supply xvar or yvar; if this
    # were a base graphics plot, we'd need those.
    #nearPoints(unique(pca_groups2), input$plot1_click, addDist = TRUE)
    brushedPoints(b, input$plot1_brush)
  })
  
  output$plot2 <- renderPlot({
    plot_uni(data)
  })
  
  output$plot3 <- renderPlot({
    plot_parallel(data)
    
  })
  output$mytable = DT::renderDataTable({data.frame(humus[ , c("Al","Cu", "Ni", "Co")])})
}

# Run the application 
shinyApp(ui = ui, server = server)

