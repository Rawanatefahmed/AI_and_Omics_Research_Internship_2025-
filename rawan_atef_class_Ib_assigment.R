getwd()
dir.create("Raw_data")
dir.create("Clean_data")
dir.create("Scripts")
dir.create("REsults")


data <- read.csv(file.choose())
View(data)
str(data)
class(data$gender)
data$gender <- as.factor(data$gender)
data$gender_fac <- as.factor(data$gender)
class(data$gender)

class(data$weight)
class(data$smoker)
data$smoker_fact <- as.factor(data$smoker)
class(data$smoker_fact)
data$smoker_fact <- ifelse(data$smoker == "yes", 1, 0)
str(data)

write.csv(data, file = "Clean_data/patient_info_clean.csv")
