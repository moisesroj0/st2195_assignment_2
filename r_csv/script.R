# Initialise package in session: rvest => .GlobalEnv()
library(rvest)

# Store the url scalar: url => character vector 
url <- "https://en.wikipedia.org/wiki/Comma-separated_values"

# Scrape the table and store it memory: cars_example => data.frame
cars_example <- 
  url %>%
  read_html() %>%
  html_node(xpath = '//*[@id="mw-content-text"]/div[1]/table[2]') %>%
  html_table(fill = TRUE) %>% 
  data.frame()

write.table(cars_example, file = "cars_example.csv", sep = ";", dec = ".")
