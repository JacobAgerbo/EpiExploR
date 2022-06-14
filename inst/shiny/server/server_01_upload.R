options(shiny.maxRequestSize = 5000 * 1024^2)
## METADATA
output$metadata <- renderTable({
  
  # input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  
  req(input$metadata)
  
  # when reading semicolon separated files,
  # having a comma separator causes `read.csv` to error
  tryCatch(
    {
      df <- read.csv(input$metadata$datapath,
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)
    },
    error = function(e) {
      # return a safeError if a parsing error occurs
      stop(safeError(e))
    }
  )
  
  if(input$disp == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

# LOAD DATA
output$data <- renderTable({
  observeEvent(input$uploadData,{
    withBusyIndicatorServer("uploadData", {
      df <- methylKit::methRead(input$data$datapath, sample.id = list(rownames(output$metadata)), assembly = "Assembly", pipeline = "bismarkCoverage", context= "CpG", mincov=1)
      # Update ui
      update_inputs(session)
    })
  })
})

