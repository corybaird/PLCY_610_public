# # Problem set 2
# 
# - Below are the functions necessary to complete problem set 2
# - We will use an internal data set that is available in r-studio
# 
# ## A.1 Import internal data set

#Imports internal data set
data(mtcars)

## A.2 Import packages
library(dplyr) #Data manipulation
library(ggplot2) #Plotting

# ### A.2.1 Common mistake!--Confirm you have installed libraries
# - Usually you only have to do this once!

#install.packages('dplyr')
#install.packages('ggplot2')


# 1. Scatterplot
## 1.1 Scatter: plot function

plot(mtcars$qsec, #x
     mtcars$drat, #y
     xlab="1/4 mile time", 
     ylab="Rear axel ratio",
     main="Answer 2.C",
     pch=19 #Sets dot
    )

## 1.2 ADVANCED FUNCTION--Scatter: ggplot library
mtcars %>% 
ggplot(
    aes(x =  qsec,y = drat)
)+
geom_point() + #Places points on chart
xlab('1/4 mile time') + 
ylab('Rear axel ratio') 


# 2. Correlation
## 2.1. Correlation: cor function

cor(mtcars$qsec, mtcars$drat)

## 2.2 Correlation: DPLYR--select
mtcars %>% 
select(drat, qsec) %>% 
cor()


# 3. Histograms and filter
## 3.1 Filter gear==3
mtcars %>% 
filter(gear==3)  %>% 
head(2)

## 3.2 Histograms
### 3.2.1 Histogram: hist function

par(mfrow=c(1,2))
hist(mtcars$vs, xlab="", main="Engine shape")
hist(mtcars$gear, xlab="", main="Gears")


### 3.2.2 Histogram: ggplot2--extragrid libraries
#install.packages('gridExtra')
library(gridExtra)

plot1 = mtcars %>% 
ggplot(aes(x=vs)) +  # x = Column_name
geom_histogram(color="black", fill="white", bins=2)

plot2 = mtcars %>% 
ggplot(aes(x=gear)) +  # x = Column_name
geom_histogram(color="black", fill="white", bins=3)

grid.arrange(plot1, plot2, ncol=2)


# 4. Two-way table
## 4.1 Two-way table: table function

freq_table = table(mtcars$gear, mtcars$vs) #(col, row)
freq_table 

### 4.1.1 Rename columns and rows
rownames(freq_table) = c('1 Gear', '2 Gear', '3 Gear')

colnames(freq_table) = c('Regular-engine', 'Vshape-engine')

freq_table

## 4.2 Percentage of total observations

prop.table(freq_table)

## 4.3 Percentage of column observations

prop.table(freq_table,2)


