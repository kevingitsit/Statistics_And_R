library(dplyr)

# deliverable 1 ----------------------------------------------------------------
#import csv
MechaCar_mpg <- read.csv(file='./data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#Perform linear regression using the lm() function. 
#lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) - example code
Mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
Mecha_lm

#view using summary
summary(Mecha_lm)
summary(Mecha_lm)$r.squared

############## Deliverable 2 ################

Suspension_Coil <- read.csv(file='./data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#create summary table
total_summary <- Suspension_Coil %>%
    summarize(Mean=mean(PSI), Median=median(PSI), Std_dev=sd(PSI))
total_summary

# view by lots using group_by

lot_summary <- Suspension_coil%>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Std_dev=sd(PSI))
lot_summary


############ Deliverable 3 ################
# Level of significance is .05
# Ho : mu =1500
# Ha : mu <> 1500
t.test(Suspension_coil$PSI, mu=1500)

# analysis - p-value greater than .05 therfore we fail to reject Ho 

# t.test by lots 
#Lot 1
t.test(subset(Suspension_Coil, Manufacturing_Lot =="Lot1")$PSI, mu=1500)

#Lot 2
t.test(subset(Suspension_Coil, Manufacturing_Lot =="Lot2")$PSI, mu=1500)

#Lot3
t.test(subset(Suspension_Coil, Manufacturing_Lot =="Lot3")$PSI, mu=1500)








