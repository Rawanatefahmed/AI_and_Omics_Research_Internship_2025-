install.packages("downloader") #Install Package
library(downloader) #Iinstall Library


#Store the URL and file name

raw_url <- "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/BMI_data_1.csv"
file_name <- "BMI_data.csv"

#Download the file

download(url = raw_url, destfile = file_name)

#Read the data into R
data <- read.csv("BMI_data.csv")

# Open many URLs
URL_BMI_data2 <- "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/BMI_data_2.csv"
DEGs_Data_1 <- "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/DEGs_Data_1.csv"
DEGs_Data_2 <- "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/DEGs_Data_2.csv"

#Then create 2 vectors, one for URLs and one for file names

file_urls <- c(URL_BMI_data2, DEGs_Data_1, DEGs_Data_2)

file_names <- c("BMI_data2.csv", "DEGs_data_1.csv", "DEG_data_2.csv")

# loop through them
for (i in seq_along(file_names)) {
  download(file_urls[i], file_names[i])
}
#download R script  
url_R <- "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/Module%20I-Basic_R_Functions-Class_2.R"
file_namer <- "url_R.R"
download(url = url_R, destfile = file_namer)

#open R script
file.edit("url_R.R")
