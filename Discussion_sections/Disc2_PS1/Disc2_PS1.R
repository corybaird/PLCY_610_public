# Problem set 1

#- Below are the functions necessary to complete problem set 1
#- We will use an internal data set that is available in r-studio

## A.1 Import internal data set


#Imports internal data set
vote_df = read.csv('vote.csv')

### A.1.1 Show the first 2 rows of mtcars
head(vote_df,2)

## A.2 Import dplyr
# 
# - Note you do not have to use DPLYR to complete the assignment!
#   - I want to introduce you to the idea of libraries!
#   - Libraries simply allow you to use more functions!
#   - If you want to know more about DPLYR please visit this [tutorial](https://github.com/corybaird/Development_economics/blob/master/TA_Sessions/R/W1_DPLYR/W1_DPLYR_code.ipynb) I made for a development economics course 

library(dplyr)
# # 1. Frequency tables
# `PS1 corresponding problem: 1b`
# 
# ## 1.1 Create table
# - See basic table of am column 
# - This is commonly called a "dummy variable"
# - In the case of am column:
#   - 1= manual
# - 0= automatic
# 
# ### 1.1.1 Create table: table function
# `Function:` table(DF_NAME\$Col_Name)

# data: DFNAME$COLUMNNAME
# function: table()
table_ans = table(vote_df$education)
table_ans

# ### 1.1.2 ADVANCED FUNCTION--Create table: DPLYR
vote_df %>% 
count(education)

# ## 1.2 Create relative frequency table
# ### 1.2.2 Create table: table function

prop.table(table_ans)

# ### 1.2.1 ADVANCED FUNCTION--Create table: DPLYR
# - DPLYR-Count-mutate
vote_df %>% 
count(education) %>% 
mutate(
    Percentage = n/sum(n) 
      )


# # 2. Histogram
# ### 2.2.1 Create histogram: histogram function
# - `Function:` hist(Data_frame\$Column, xlab="", ylab="", main="")


hist(vote_df$income, xlab="Name this label", ylab="Name that label", main="Title")

# ### 2.2.2 ADVANCED FUNCTION--Create histogram: ggplot2
# - ggplot2 is another library you must install like DPLYR
#install.packages('ggplot2') # If you have not installed
library(ggplot2)

vote_df %>% 
ggplot(aes(x=income)) +  #x= Column_name
geom_histogram(color="black", fill="white", bins=10)


# # 3. Summarise
# - `PS1 corresponding problem: 1e`
# ## 3.1 Summary stats: summary()
# - `Function:` summary(DF_NAME\$Col_Name)
# - Reads csv

summary(vote_df$income)


## 3.2 Summary stats: ADVANCED FUNCTION--dplyr
vote_df %>% 
select(income, education) %>% 
summary()


# 4. Groupby
## 4.1 Summary stats: mean, sd function
#mean
female_mean =  mean(vote_df$income[vote_df$sex==1])
#sd
female_sd = sd(vote_df$income[vote_df$sex==1])
#Put both results in the same table
summary_table = cbind(female_mean, female_sd)
summary_table

## 4.1 ADVANCED FUNCTION--Summary stats: dplyr--groupby
vote_df %>% 
group_by(sex) %>% 
summarise(
    avg_wt = mean(income),
    sd_wt = sd(income))


