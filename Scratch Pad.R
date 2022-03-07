
library(fpp3)
library(readr)

# Read Data
stocks <- read_csv("nyse_stocks.csv.zip")
View(stocks)

# Convert to tsibble()
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)

# 1 stock 
# (make sure you specify stock and object of interest (open, closed, max))
selected_stock = "AAPL"
stocks %>%
  filter(symbol == selected_stock)%>%
  autoplot(high) +
  labs(title = selected_stock)

# Multiple stocks
# why is my graph not showing two lines?
selected_stocks <- c("GOOG", "AAPL")

stocks %>%
  filter(symbol %in% selected_stocks) %>%
  autoplot(open)
