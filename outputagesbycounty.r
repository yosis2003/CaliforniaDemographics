
library(stringi)
library(stringr)
library(readxl)
library(tidyverse)
library(writexl)


# Install and load the readxl package if not already installed
# install.packages("readxl")
library(readxl)



# Set the path to the folder containing Excel files
folder_path <- "C:/Users/yousi/OneDrive/Documents/ITS/Demographics/Ages"

# Get a list of Excel files in the folder
excel_files <- list.files(path = folder_path, pattern = "\\.xlsx$", full.names = TRUE)

# Create an empty list to store the data frames
all_results <- list()

# Loop through each Excel file and read it into a data frame
for (file in excel_files) {
    data <- read_excel(file)
    twenty_results <- (data[9, seq(2, ncol(data), by = 2)])
    sixtyfive_results <- data[21, seq(2, ncol(data), by = 2)]
    twenty_results <- as.numeric(twenty_results)
    sixtyfive_results <- as.numeric(sixtyfive_results)
    calculated_results = twenty_results - sixtyfive_results
    all_results[[file]] <- calculated_results
}
combined_results <- do.call(cbind, all_results)
write.csv(combined_results, file = "C:/Users/yousi/OneDrive/Documents/ITS/Demographics/Ages/results.csv", row.names = FALSE)
# Alternatively, you can use lapply to achieve the same result
# all_data <- lapply(excel_files, read_excel)

# Now, all_data is a list containing data frames from all Excel files
