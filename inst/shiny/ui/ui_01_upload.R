tabPanel("Upload Data",
         tabsetPanel(
           tabPanel("Load",
                    br(),
  # App title ----
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ----
      fileInput("data", "Choose .cov File(s)",
                multiple = TRUE,
                accept = NULL),
    ),
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Metadata file ----
      tableOutput("Data")
      
    ),
    
    
),
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ----
      fileInput("metadata", "Choose Sample Information File",
                multiple = FALSE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      
      # Horizontal line ----
      tags$hr(),
      
      # Input: Checkbox if file has header ----
      checkboxInput("header", "Header", TRUE),
      
      # Input: Select separator ----
      radioButtons("sep", "Separator",
                   choices = c(Comma = ",",
                               Semicolon = ";",
                               Tab = "\t"),
                   selected = ","),
      # Horizontal line ----
      tags$hr(),
      
      # Input: Select number of rows to display ----
      radioButtons("disp", "Display",
                   choices = c(Head = "head",
                               All = "all"),
                   selected = "head")
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Metadata file ----
      tableOutput("Metadata")
      
    )
    
  ),
withBusyIndicatorUI(
  actionButton("uploadData",
               "Upload",
               class = "btn-primary")
),
helpText("This might take a few seconds to upload.")
)
)
)