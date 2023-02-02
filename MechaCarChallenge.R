#import dependencies
library(dplyr)
library(tidyverse)
#Deliverable 1: Linear Regression to Predict MPG
#Read MechaCar_mpg.csv
MechaCar_mpg <- read_csv("MechaCar_mpg.csv") 
#Check dataframe
head(MechaCar_mpg)
#Perform Linear Regression through all six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)
#Determine the p-value and the r-squared value using summary()
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

#Deliverable 2: Create Visualizations for the Trip Analysis
#Read csv and create dataframe
coils <- read_csv("Suspension_Coil.csv")
#Check dataframe
head(coils)
#Find the mean, median, variance and standard deviation using summarize()
total_summary <- coils %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
#Find the summary for each lot
lot_summary <- coils %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Deliverable 3: T-Tests on Suspension Coils
#Determine if the PSI across all manufacturing lots is difference from the population mean of 1,500psi
t.test((coils$PSI),mu = 1500)
#Determine if the PSI across each manufacturing lot is difference from the population mean of 1,500psi
t.test(subset(coils,Manufacturing_Lot =="Lot1")$PSI, mu = 1500)
t.test(subset(coils,Manufacturing_Lot =="Lot2")$PSI, mu = 1500)
t.test(subset(coils,Manufacturing_Lot =="Lot3")$PSI, mu = 1500)
