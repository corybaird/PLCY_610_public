# PLEASE READ:
# THE FOLLOWING CODE COVERS THE FUNCTIONS NECESSARY FOR PROBLEM 3 THAT I FAILED TO COVER IN THE VIDEO

# Question 3
# Creates 100 draws from the normal distribution
draws = 100
normal_data = rnorm(draws, mean =0, sd=1)

# Samples 10 observations from this distribution
sample_1 = sample(normal_data, 10)
sample_2 = sample(normal_data, 100)

# Create histogram
hist(sample_1)


# Problem set 2
# The lecture notes for this code can be found at:
# https://github.com/corybaird/PLCY_610_public/blob/master/Discussion_sections/Disc4_PS2/Disc4_PS2.ipynb


## A.1 Import data set

df = read.csv('demo.csv')
head(df,3)

# 1. Review commands for PS2
## 1.1 Problem 2c

plot(df$gdp, #x
     df$polity2, #y
     xlab="1/4 mile time", 
     ylab="Rear axel ratio",
     main="Answer 2.C",
     pch=19 #Sets dot
     )
     
## 1.2 Problem 2d
     
cor(df$gdp, df$wealth)
     
     
## 1.3 Problem 2e
### 1.3.1 Filter by regimes
     
autocracy_df = df[df$regime==1,]
democracy_df = df[df$regime==3,]

wealthy_df = df[df$wealth>1,]

  
### 1.3.2 Plot two histograms

par(mfrow=c(1,2)) #Print two histograms
hist(democracy_df$polity2, xlab="", main="TITLE") # Graph 1
hist(autocracy_df$polity2, xlab="", main="TITLE") #Graph
     
     
## 1.4 Problem 2f
     
freq_table = table(df$wealth, df$regime) #(col, row)
rownames(freq_table) = c('Wealth 1', 'Wealth 2', '3 Gear')
colnames(freq_table) = c('Regime 1', 'Regime 2', 'col3')
freq_table 
     
     
## 1.5 Problem 2g
     
prop.table(freq_table)

prop.table(freq_table,2)
     



     
# 2. DPLYR basics (OPTIONAL)
# Step 1: Install 
install.packages('dplyr')
# Step 2: libary(dplyr)
library(dplyr)
     
##  Why use libraries? The short answer: they are often easier to understand!
     
#Method 1
cor(df$gdp, df$wealth)
     
#Method 2
# Shortcut pipe operator: command shift m
df %>% 
  select(gdp, wealth) %>% 
  cor()
     
     
## 2.1 Select: is to select the columns
df  %>% 
  select(gdp, wealth, country)  %>% head(3)

df %>% 
  select(contains('gdp')) %>% 
  head(3)
     

## 2.2 Filter
     
### 2.2.1 Filter using =

df  %>% 
  filter(regime==1)  %>% 
  head(3)
     
### 2.2.2 Filter using < or >
     
df  %>% 
  filter(gdp>10000) %>% 
  head(3)
     
     
### 2.2.3 Filter using | or &
     
# Or
df  %>% 
  filter(gdp>17000 | gdp<500)  %>% head(3)
     
# And
df  %>% 
  filter(gdp>10000 & regime==2)  %>% head(3)
     
     
## 2.3 Mutate 

df  %>% 
  mutate(log_gdp = log(gdp),
              gdp_mean = mean(gdp),
              gdp_sd = sd(gdp),
              gdp_pct = percent_rank(gdp), #Percentile
              gdp_cumsum = cumsum(gdp)
       )%>% head(2)
     
     
## 2.4 Summarise
     
df %>% 
  summarise(mean_gdp = mean(gdp),
                 median_gdp = median(gdp),
                 sum_gdp = sum(gdp),
                 count_gdp = n(),
                 first_gdp = first(gdp),
                 last_gdp = last(gdp),
                 variance = var(gdp),
                 sd = sd(gdp))
     
     
## 2.5 Groupby
df  %>% 
  group_by(regime) %>% 
  summarise(
         mean_gdp = mean(gdp))
     
     
     
## 2.6 Combining functions with %<%
     
df  %>% 
  select(gdp, regime) %>% 
  group_by(regime) %>% 
  mutate(gdp_log = log(gdp)) %>% 
  summarise(mean_gdp = mean(gdp_log))  
     
     
# 3. World bank data (EXTREMELY OPTIONAL)

#install.packages('WDI')

library(WDI)
     
## 3.1 Search for data

#Function: WDIsearch()
WDIsearch(string="poverty", field = "name") %>% 
  as_tibble() 


     
     
## 3.2 Download data

#Function : WDI()
     
poverty_df = WDI(indicator="1.0.HCount.2.5usd", country='MX',start=2005, end=2019)
poverty_df
     