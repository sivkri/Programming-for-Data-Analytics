
# Unit 5 Lab: Advanced Data Handling & Analysis with R
# Focus: ggplot2 visualizations, EDA, hypothesis testing, linear regression
# Save as Unit5_R_Advanced.R and run in RStudio

# 1. Sample data: rainfall and temperature
rain <- c(120, 80, 95, 110, 140, 130, 100, 85, 90, 105)
temp <- c(28, 25, 27, 29, 30, 31, 26, 24, 27, 28)
df <- data.frame(Month=1:10, Rainfall=rain, Temperature=temp)
print(df)

# 2. Basic EDA
print(summary(df))
print(cor(df$Rainfall, df$Temperature))

# 3. ggplot2 plotting (install if needed)
if(!require(ggplot2)){ install.packages('ggplot2', repos='https://cloud.r-project.org'); library(ggplot2) } else { library(ggplot2) }

ggplot(df, aes(x=Temperature, y=Rainfall)) +
  geom_point() +
  geom_smooth(method='lm', se=FALSE) +
  ggtitle('Rainfall vs Temperature') +
  xlab('Temperature (°C)') + ylab('Rainfall (mm)')

# 4. Boxplot example
cement_prices <- data.frame(Month=1:12, Price=c(300,320,310,305,330,340,335,325,315,310,300,305))
ggplot(cement_prices, aes(x=factor(1), y=Price)) + geom_boxplot() + ggtitle('Cement Price Variation') + xlab('') + ylab('Price (INR)')

# 5. Hypothesis testing: t-test (one-sample)
# H0: mean rainfall = 100 mm
t_test <- t.test(df$Rainfall, mu=100)
print('One-sample t-test for mean rainfall vs 100 mm:')
print(t_test)

# 6. Two-sample t-test example (simulated)
groupA <- rnorm(15, mean=75, sd=8)
groupB <- rnorm(15, mean=70, sd=10)
t2 <- t.test(groupA, groupB)
print('Two-sample t-test between groupA and groupB:')
print(t2)

# 7. Linear regression: Predict Rainfall by Temperature
model <- lm(Rainfall ~ Temperature, data=df)
print(summary(model))
# Plot regression line
plot(df$Temperature, df$Rainfall, main='Rainfall vs Temperature with Regression Line', xlab='Temperature', ylab='Rainfall')
abline(model, col='red')

# 8. Save model summary to file
sink('model_summary.txt')
print(summary(model))
sink()
print('Saved model_summary.txt')


# ----------------------------------------
# Trainer's Answers & Expected Outputs — Unit 5 Lab
# 1. Dataframe 'df' prints 10 rows for Rainfall and Temperature as defined.
# 2. summary(df) shows min/mean/max for Rainfall (~80-140) and Temperature (~24-31).
# 3. cor(df$Rainfall, df$Temperature) prints a numeric correlation (may be small, e.g., 0.2-0.6 depending on values).
# 4. ggplot scatter with geom_smooth shows a fitted line; slope printed in lm summary.
# 5. Boxplot displays cement price variation; median and whiskers visible.
# 6. One-sample t-test output: t statistic and p-value. Expect p-value maybe >0.05 depending on sample.
# 7. Two-sample t-test prints t and p-value comparing groupA and groupB (randomized).
# 8. Linear regression summary: coefficients, R-squared, and p-values. Expect modest R-squared for small sample.
# 9. model_summary.txt file is saved with lm summary.
#
# Grading / Discussion Tips:
# - Confirm plots render and model summary saved.
# - Ask students to interpret p-values and regression coefficients in plain language.
# ----------------------------------------
