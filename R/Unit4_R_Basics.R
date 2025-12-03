
# Unit 4 Lab: Introduction to R and Fundamentals
# Focus: Vectors, matrices, data frames, basic dplyr usage
# Save this file as Unit4_R_Basics.R and run in RStudio or R console

# 1. Vectors and basic operations
heights <- c(160, 170, 180, 155, 165)
weights <- c(60, 72, 68, 50, 58)
bmi <- weights / ((heights/100)^2)
print('BMI values:')
print(round(bmi,2))

# 2. Matrices
marks <- matrix(c(80,90,85,70,95,88), nrow=3, byrow=TRUE)
print('Marks matrix:')
print(marks)

# 3. DataFrame creation and inspection
students <- data.frame(Name=c('Asha','Ravi','Meera','John','Priya'),
                       StudyHours=c(4,6,3.5,5,7),
                       ExamScore=c(78,85,67,74,92))
print('Students dataframe:')
print(students)
summary(students)

# 4. Basic dplyr operations (install dplyr if needed)
if(!require(dplyr)){ install.packages('dplyr', repos='https://cloud.r-project.org'); library(dplyr) } else { library(dplyr) }

# Filter students with ExamScore > 75, select Name and ExamScore, arrange descending
top_students <- students %>% filter(ExamScore > 75) %>% select(Name, ExamScore) %>% arrange(desc(ExamScore))
print('Top students:')
print(top_students)

# 5. Tidying example using tidyr (wide to long)
if(!require(tidyr)){ install.packages('tidyr', repos='https://cloud.r-project.org'); library(tidyr) } else { library(tidyr) }

scores_wide <- data.frame(Student=c('Asha','Ravi','Meera'),
                          Math=c(80,90,70),
                          Science=c(85,88,69))
print('Wide format:')
print(scores_wide)
scores_long <- pivot_longer(scores_wide, cols=c(Math,Science), names_to='Subject', values_to='Score')
print('Long format:')
print(scores_long)

# 6. Save cleaned data to CSV
write.csv(students, 'students_cleaned.csv', row.names=FALSE)
print('Saved students_cleaned.csv')


# ----------------------------------------
# Trainer's Answers & Expected Outputs — Unit 4 Lab
# 1. BMI values: numeric vector of 5 rounded values (approx 20-30 depending on heights/weights).
# 2. Marks matrix: printed 3x2 or 2x3 depending on byrow; values shown as given.
# 3. Students dataframe: shows 5 rows with StudyHours and ExamScore; summary() prints min/median/mean.
# 4. top_students: should list students with ExamScore > 75 (Asha, Ravi, Priya in example).
# 5. scores_long: pivoted data with 6 rows (3 students × 2 subjects).
# 6. CSV 'students_cleaned.csv' created in working directory.
#
# Grading / Discussion Tips:
# - Check that students can run the script end-to-end without syntax errors.
# - Inspect printed outputs for correct values and types.
# - Verify dplyr pipeline uses filter/select/arrange correctly.
# ----------------------------------------
