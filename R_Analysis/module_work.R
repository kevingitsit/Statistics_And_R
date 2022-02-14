library(tidyverse)

demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original data frame

demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original data frame

summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table

demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)

long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)

wide_table <- long_table %>% spread(key="Metric",value="Score")

#The comma in the bracket indicates tat we are selecting the whole row.
table <- demo_table3[,(colnames(wide_table))]

head(mpg)

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=class))
#plot a bar plot
plt + geom_bar() 

#create summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') 
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count))
#plot a bar plot
plt + geom_col() 

#plot bar plot with labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") +
#rotate the x-axis label 45 degrees
theme(axis.text.x=element_text(angle=45,hjust=1)) 

#create summary table
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') 
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) 
#plot line graph
plt + geom_line()

#add line plot with labels
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty)) #import dataset into ggplot2

#add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") 

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) 
#add scatter plot with labels
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class") 

#import dataset into ggplot2
plt <- ggplot(mpg,aes(y=hwy))
#add boxplot
plt + geom_boxplot() 

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))

#add boxplot and rotate x-axis labels 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

#create summary table
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')

plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))

#create heatmap with labels
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)")


mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2

plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + 
  #add heatmap with labels > 
  
theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5))

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) 

#add boxplot
plt + geom_boxplot() + 
  theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
  geom_point() #overlay scatter plot on top


mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot


mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

#import dataset into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) 
#add boxplot with labels rotated 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) 

?facet_wrap()

#import dataset into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) 
#create multiple boxplots, one for each MPG type
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + 
  #rotate x-axis labels
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") 

#visualize distribution using density plot
ggplot(mtcars,aes(x=wt)) + geom_density()

shapiro.test(mtcars$wt)

#import used car dataset
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) 
#import dataset into ggplot2
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) 
#visualize distribution using density plot
plt + geom_density() 

#we want to transform our miles driven using a log10 transformation. 
#This is because the distribution of raw mileage is right skewed—a few used vehicles have more than 100,000 miles, while the majority of used vehicles have less than 50,000 miles. 
#The log10 transformation makes our mileage data more normal.

sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

#compare sample versus population means
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) 



sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points


t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples


mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008


t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples


mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor

aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels

summary(aov(hp ~ cyl,data=mtcars_filt))

?cor()
head(mtcars)

#Test to visualize see if Horesepower is correlated to quarter-mile race time
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() #create scatter plot


# use out cor() function to quanitfy the strength between out two variables:
cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient

#From our correlation analysis, we have determined that the r-value between horsepower and 
#quarter-mile time is -0.71, which is a strong negative correlation.

used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)


#For this example, we'll test whether or not vehicle miles driven and selling price are correlated.
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import dataset into ggplot2
plt + geom_point() #create a scatter plot

#calculate the correlation of both variables
cor(used_cars$Miles_Driven, used_cars$Selling_Price)

used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into numeric matrix
cor(used_matrix)


lm(qsec ~ hp,mtcars) #create linear model

summary(lm(qsec~hp,mtcars)) #summarize linear model

model <- lm(qsec ~ hp,mtcars) #create linear model
yvals <- model$coefficients['hp']*mtcars$hp +
model$coefficients['(Intercept)'] #determine y-axis values from linear model


plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model

summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

table(mpg$class,mpg$year) #generate contingency table

tbl <- table(mpg$class,mpg$year) #generate contingency table
chisq.test(tbl) #compare categorical distributions
