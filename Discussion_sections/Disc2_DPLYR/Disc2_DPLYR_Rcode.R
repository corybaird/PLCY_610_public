# Introduction to DPLYR
## You should use this tutorial while referencing this notebook which shows both the code and output
### https://github.com/corybaird/PLCY_610_public/blob/master/Discussion_sections/Disc2_DPLYR/Disc2_DPLYR.ipynb

# 1. Basics
## 1.1 Find file path

### 1.1.1 Finding file paths on macs
# - Copy the where section and paste should give you a file path
# - For example: Users/NAME/Desktop/R/filename.extension

### 1.1.2 Finding file path within R

path = getwd() #Sets current working directory
print(paste("The current working directory is: ", getwd(), sep=""))

## 1.2 Import files
### 1.2.1 Import from: current working directory
#### 1.2.1.1 Lets import that file from an internal data set!

#Download internal data set: cars data
data("mtcars") 

#Show the first two lines of the data set
head(mtcars, 2)

##### 1.2.1.1.1 Write the internal data set to csv file
write.csv(mtcars, "cars.csv") #Name the dataset "cars.csv" and save to current working directory


#### 1.2.1.2 Now import "cars.csv" which is now in our current directory
# Avoid the following mistake when importing data
# read.csv("cars.csv")

# Must add "YOURNAME =" to save the dataframe!
df = read.csv("cars.csv") #We often name our dataframes df_NAME

##### 1.2.1.2.1 Check the first two lines of the cars.csv file now imported as "df"
head(df,2)


### 1.2.2  Import from: not in our current directory
# We need to know the file path of the file!!
dir.create('New_directory') #Creates new folder

# #### 1.2.2.1 Create new directory (folder) and place new data set
# 
# - You do not need to understand the following code
# - It is a fancy way to create a new folder and saves a csv file inside that new folder
# - We will import the csv file from that new folder


setwd("New_directory") #Changes working directory

data("USArrests") #Imports internal data set

write.csv(USArrests, "arrests.csv") #Name the dataset "arrests.csv" and save to current working directory

setwd(path) #Returns to our original file path!!!

getwd() #Checks our path which is not in the folder we just created


# #### 1.2.2.2 Import "arrests.csv" from the "New_directory" folder
# - We can do this even from our original file path position because we added the name of the folder before the file
# - read.csv("FOLDER_NAME/FILE_NAME.csv")
df_arrests = read.csv("New_directory/arrests.csv")

head(df_arrests,2)



### 2.1.1 Download and import dplyr package
#### 2.1.1.1 Downloading packages

#install.packages("dplyr") #Uncomment and install if you ahve not installed yet
library(dplyr) # Do not worry if you see red code those are just warning messages

### 2.2 Select
#We can list all the column names from a Data Frame
colnames(df)

### 2.2.1 Select one column

df %>% #Dataframe
select(X)%>% #Select column named X
head(3) #Shows only first 3 obs

### 2.2.2 Select multiple columns

df %>% #Dataframe
select(cyl, disp, hp, wt)%>% #Select column named X
head(2) #Shows only first 2 obs

## 2.3 Filter 
### 2.3.1 Filter by 1 condition

df %>% 
filter(mpg>22)%>% #filter all observations over 25 mpg
head(2)


### 2.3.2 Filter by 2 conditions

df %>% 
filter(mpg>22 & mpg<35) %>% head(2)

df %>% 
filter(gear!=4)%>% head(2)

## 2.4 Arrange
### 2.4.1 Arrange by column (Ascending)

df %>% 
arrange(mpg)%>% 
head(3)

### 2.4.2 Arrange  (Descending)

df %>% 
arrange(desc(mpg))%>% 
head(3)


## 2.5 Mutate 
### 2.5.1 Mutate
df %>% 
mutate(mpg_10 = mpg/10) %>% head(2)

df %>% 
mutate(cumulative_wt = cumsum(wt), #cumulative
       lag_wt = lag(wt), #Opposite function: lead()
       Percent_wt = percent_rank(wt)
      ) %>% head(2)

## 2.6 Summarise

df %>% 
summarise(mean_mpg = mean(mpg),
        median_mpg = median(mpg),
         sum_mpg = sum(mpg),
         count_mpg = n(),
         first_obs = first(mpg),
         last_obs = last(mpg),
         variance = var(mpg),
         sd = sd(mpg))

## 2.7 Groupby 

df %>% 
group_by(gear) %>% 
summarise(mpg_by_gear = mean(mpg))

# 3. Other DPLYR functions
## 3.1 Count

df %>% 
count(gear)

## 3.2 Distinct

df %>% 
distinct(X)%>% head(3)








