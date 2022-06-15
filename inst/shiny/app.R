dependencies <- c("devtools","BiocManager","shiny","shinyjs",
                  "MultiAssayExperiment","ggplot2","plotly",
                  "shinythemes", "tidyverse", "methylKit", "sessioninfo", "memoise", "edmr")

# Install packages not yet installed
#CRAN
installed_packages <- dependencies %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(dependencies[!installed_packages])}
#BiocManager
installed_packages <- dependencies %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
BiocManager::install(dependencies[!installed_packages])}

#Devtools github: edmr
installed_packages <- "edmr" %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
devtools::install_github("PierreMasselot/emdr")}

# Packages loading
invisible(lapply(dependencies, library, character.only = TRUE))
# source helper for ui
source(file.path("helpers", "helpers.R"),  local = TRUE)
source(file.path("helpers", "ui_helpers.R"),  local = TRUE)

## 
ui <- navbarPage(
  title = paste("EpiExploR - helps scientist making stats in R"),
  id="EpiExploR",
  fluid=TRUE,
  theme = shinytheme("slate"),
  source(file.path("ui", "ui_01_upload.R"),  local = TRUE)$value,
  #source(file.path("ui", "ui_02_filter.R"),  local = TRUE)$value,
  #source(file.path("ui", "ui_03_testing.R"),  local = TRUE)$value,
  #source(file.path("ui", "ui_04_ordination.R"),  local = TRUE)$value,
  #source(file.path("ui", "ui_05_network.R"),  local = TRUE)$value
)

server <- function(input, output, session) {
  source(file.path("server", "server_01_upload.R"),  local = TRUE)$value
  #source(file.path("server", "server_02_filter.R"),  local = TRUE)$value
  #source(file.path("server", "server_03_testing.R"),  local = TRUE)$value
  #source(file.path("server", "server_04_ordination.R"),  local = TRUE)$value
  #source(file.path("server", "server_05_network.R"),  local = TRUE)$value
}

shinyApp(ui = ui, server = server)
