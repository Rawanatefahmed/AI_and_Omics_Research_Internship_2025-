#Rightward assigment opperator 
height <- c(11.1, 12.5, 16.1)
#leftward assigment opperator
c(10, 20, 30, 40) -> weight
#assigs used in function arguments 
smoking_status = c("Yes", "No", "No", "Yes")

#basic math
# + addition 
# - substraction 
# * multiplication
# / division 
# ^ exponent (power)
BMI <- weight/(height^2)
BMI
BMI > 25
BMI <18.5
(BMI < 1) & (smoking_status == "Yes") #need both conditions true
(BMI > 25) & (smoking_status == "No")
(BMI > 25) | (smoking_status == "Yes") #just need one condition
BMI
smoking_status
smoking_status == "No"

#numeric vectors to make mathematical calculations 
num_vec <- c(1, 2, 3, 4)
class(num_vec)
#character vector
chrc_vector <- c("gene1", "gene2", "gene3")
class(chrc_vector)

#logical vectors
logic_vec <- c(TRUE, FALSE, TRUE)
class(logic_vec)
#extract values from vectors using []
num_vec[2]
num_vec[2:5] #: indicates sequence
 
all_vect <- list(num_vec, chrc_vector, logic_vec)
View(all_vect)
vec_col <- cbind(num_vec, chrc_vector)

my_matrix <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)
 #to mention for variable in specific cell
#my_matrix[#rows, #columns]
my_matrix[2,3]
my_matrix[2,]

data <- data.frame(
  patient_id = c("p1", "p2", "p3"),
  age = c(20, 30, NA),
  diagnosis = c("cancer", "diabetes", "cancer")
)
print(data)
str(data)
head(data)
head(data, n=1)
tail(data)
tail(data, n=2)
dim(data)
names(data)
data$patient_id
data[c(1,3), c(2,3)]
list(data)
#to detect missin data
is.na(data)
#sum of missing data
sum(is.na(data))
#missing data by column 
colSums(is.na(data))
#missing value by rows
rowSums((is.na(data)))
#to remova na data by reoving rows
clean_data1 <- na.omit(data)
clean_data1
#clean data by removing columns 
clean_data2 <- data[, colSums(is.na(data)) == 0]
clean_data2
clean_data3 <- data
clean_data3[is.na(clean_data3)] <- 0
clean_data3
#calculate the mean
clean_data4 <- data
clean_data4[is.na(clean_data4)] <- mean(data$age, na.rm = TRUE)
clean_data4
#calculate BMI
#arguments(inputs)
function(x) #input
  #steps and operation
#Bmi <- weight/(height^2)
#return value (output)

return(Bmi)
#create function to calculate BMI

calculate_BMI <- function(weight, height){
  bmi <- weight/(height^2)
  return(bmi)
  }


calculate_BMI(weight = 80, height = 1.73)  
 calculate_BMI(weight = weight, height = height)

 input_dir <- "Raw_Data"
 output_dir <- "Results"
 if(!dir.exists(output_dir)){
   dir.create(output_dir)
 }
 files_to_process <- c("BMI_data_1.csv", "BMI_data_2.csv")
 result_list <- list() 
for (files_name in files_to_process) {
  cat("\nProcessing:", files_name, "\n")
  input_file_path <- file.path(input_dir, files_name)
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. checkin for missing values...\n")
  if("height" %in% names(data)){
    missing_count <- sum(is.na(data$height))
    cat("Missing values in'height':", missing_count, "\n")
    
    data$height[is.na(data$height)] <- mean(data$height, na.rm = TRUE)
    }
  if("weight" %in% names(data)){
    missing_count <- sum(is.na(data$weight))
    cat("Missing values in'weight':", missing_count, "\n")
    data$weight[is.na(data$weight)] <- mean(data$weight, na.rm = TRUE)
  } 
  data$bmi <- calculate_BMI(data$weight, data$height)
  cat("BMI has been calculated successfully.\n")
  result_list[[files_name]] <- data
  output_file_path <- file.path(output_dir, paste0("BMI_rsults", files_name))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to:", output_file_path, "\n")
  }
 results_1 <- result_list[[1]]
 results_2 <- result_list[[2]]
 