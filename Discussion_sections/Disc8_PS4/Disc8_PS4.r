#Tutorial can be found at the link below
#https://nbviewer.jupyter.org/github/corybaird/PLCY_610_public/blob/master/Discussion_sections/Disc8_PS4/Disc8_PS4.ipynb


# A.1
#install.packages('dplyr')
library(dplyr)

## A.2

# Github file url
url = 'https://raw.githubusercontent.com/corybaird/PLCY_610_public/master/Discussion_sections/Disc7_PS4/ps4data.csv'

# Download data into df 
df = read.csv(url)

# Show head
df %>% head(3)


## 1.1 Calculation: by hand¶
### 1.1.1 Standard error¶

# standard deviation
sd = sd(df$age)

# n (sample size)
n = length(df$age)

standard_error = sd/(sqrt(n))
standard_error

### 1.1.2 t-score¶

# t-score with a 95% confidence level
tscore = qt(0.975, df=length(df$age)-1) #note df= degrees of freedom not dataframe!

# x-bar (mean)
x_bar = mean(df$age)


### 1.1.3 Confidence intervals¶

lower_confidence = x_bar - tscore*standard_error
lower_confidence

upper_confidence = x_bar + tscore*standard_error
upper_confidence


##1.2 Calculation: by function (OPTIONAL)¶

answer_function = function(column){
   
    sd = sd(column)
    n = length(column)
    standard_error = sd/(sqrt(n))
    tscore = qt(0.975, df=length(column)-1) #note df= degrees of freedom not dataframe!
    solu = tscore*standard_error

    x_mean = mean(column)

    conf_lower = round(x_mean-solu,6)
    conf_upper = round(x_mean+solu,6)
    
    print(paste('Mean:', x_mean,'+-', round(tscore,3),'*',round(standard_error,3), sep=''))
    print(paste('Upper bound: ', conf_upper, ' Lower bound: ', conf_lower, sep=''))
}


### 1.2.1 Use answer_function
answer_function(df$age)


# 2. t-tests¶
## 2.1 Two sided t-test: ONE MEAN¶


# Is the mean for age statistically different than 30?
age = 30 

t.test(df$age, mu = age)


##2.2 Two sided t-test: ONE MEAN¶

# Is the mean for age statistically different than 22?
age = 22

t.test(df$age, mu = age)


#2.3 Two-side t-test: TWO MEANS¶
## 2.3.1 Seperate two groups (filter data)¶

df_abducted = df %>% filter(abd==1)

df_abducted %>% head(2)

df_non_abducted = df %>% filter(abd==0)

df_non_abducted %>% head(2)


## 2.3.2 Conduct t-test: Compare ages¶

t.test(df_abducted$age, df_non_abducted$age)


## 2.3.2.1 Conduct t-test: Compare ages (Alternative method)¶

t.test(df$age[df$abd==1], df$age[df$abd==0])


## 2.3 one-side t-test: TWO MEANS¶
### 2.3.1 Alternative hypothesis: less than 0¶

t.test(df_abducted$educ, df_non_abducted$educ, alternative='greater')


#2.4 Two side t-test: TWO MEANS¶

t.test(df_abducted$fthr_ed, df_non_abducted$fthr_ed)


