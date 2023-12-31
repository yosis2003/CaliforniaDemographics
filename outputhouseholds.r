
library(stringi)
library(stringr)
library(readxl)
library(tidyverse)
library(writexl)


# Install and load the readxl package if not already installed
# install.packages("readxl")
library(readxl)



# Set the path to the folder containing Excel files
folder_path <- "C:/Users/yousi/OneDrive/Documents/ITS/Demographics/Households with children"

# Get a list of Excel files in the folder
excel_files <- list.files(path = folder_path, pattern = "\\.xlsx$", full.names = TRUE)

# Create an empty list to store the data frames
all_results <- list()

# Loop through each Excel file and read it into a data frame
for (file in excel_files) {
  data <- read_excel(file)
  results <- data[4, seq(2, ncol(data), by = 2)]
  results <- as.numeric(results)
  calculated_results = results
  print(results)
  all_results[[file]] <- calculated_results
}
combined_results <- sapply(all_results, cbind)


print(class(calculated_results))
write.csv(combined_results, file = "C:/Users/yousi/OneDrive/Documents/ITS/Demographics/Households with children/results.csv", row.names = FALSE)
# Alternatively, you can use lapply to achieve the same result
# all_data <- lapply(excel_files, read_excel)

# Now, all_data is a list containing data frames from all Excel files
