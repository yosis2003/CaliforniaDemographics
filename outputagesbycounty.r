
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
all_data <- list()

# Loop through each Excel file and read it into a data frame
for (file in excel_files) {
    data <- read_excel(file)
    all_data[[file]] <- data
}

print(all_data[1][])

# Alternatively, you can use lapply to achieve the same result
# all_data <- lapply(excel_files, read_excel)

# Now, all_data is a list containing data frames from all Excel files
