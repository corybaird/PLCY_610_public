#Tutorial can be found at the link below
#https://nbviewer.jupyter.org/github/corybaird/PLCY_610_public/blob/2083f92b7fe06ae3f61b9aa0f625d928b7891b27/Discussion_sections/Disc9_PS5/Disc9_PS5.ipynb


#A.1
#install.packages('dplyr')
library(dplyr) #Data manipulation

# 1. 
# In a 1994 study, 164 pregnant, HIV-positive women were randomly assigned 
# to receive the drug AZT during pregnancy and 160 pregnant,
# HIV-positive women were randomly assigned to a control group that received a placebo. 
# The study found that 40 of the mothers in the control group gave birth
# to babies who were HIV-positive, compared to only 13 in the AZT group.


## 1.1 Create table
# ps 1.a

n = 164+160

#“success” as a baby testing negative for HIV.
#Change x number to get answer for your assignment
x = n-20-10 #-NUMBER #-NUMBER

p = x/n

table_1 = cbind(x,n,p) # cbind() columns
table_1


## 1.2 Standard error calculation
# ps 1.b

### 1.2.1 Easy version
sqrt(p*(1-p)/n)


# 1.2.2 Difficult version
answer_function_12 = function(sampling_proportion, n){
    step_1 = sampling_proportion*(1-sampling_proportion)
    step_2 = step_1/n
    step_3 = sqrt(step_2)
    return (step_3)
}

std_error = answer_function_12(p, n)


## 1.3 Create 95% CI interval
# ps 1.c

### 1.3.1 Easy version
z = 1.5
p+(z*std_error)
p-(z*std_error)


### 1.3.2 Difficult
answer_function_13 = function(sampling_proportion, z, std_error){
    
    rhs = z*std_error
    
    conf_lower = p-rhs
    conf_upper = p+rhs
    
    print(paste('p +-', round(z,3),'*',round(std_error,3), sep=''))
    print(paste('Upper bound: ', conf_upper, ' Lower bound: ', conf_lower, sep=''))
}

#Change z number to get answer for your assignment
z = 1.5

answer_function_13(p, z, std_error)



## 1.4 Conduct a two-sided hypothesis test, at α = .05
# assessing the likelihood that pˆ is actually .25
# ps 1.d

prop.test(x, n, p=.25, correct=F)



# 2. 
#The poll found that 68 / 232 people aged 18-34 reported that they approved, 
#128 / 332 people aged 35-54 reported that they approved, 
#and 173 / 338 people aged 55+ reported that they approved.

## 2.1 Table

table_21 = matrix(nrow=2, ncol=3, c(68,164,128,204,173,165))
table_21


## 2.2 Chi-square expected values

### 2.2.1 chisq function

chisq.test(table_21 , correct=F)$expected



### 2.2.2 by hand (OPTIONAL)

table_21_full = as_tibble(table_21)  %>% mutate(total= rowSums(.))
table_21_full = rbind(table_21_full, colSums(table_21_full))
table_21_full


#3rd row
col_sums = table_21_full[3,1:3]
col_sums

#4th column
row_sums_1 = as.numeric(table_21_full[1,4])
row_sums_2 = as.numeric(table_21_full[2,4])
print(row_sums_1)
print(row_sums_2)

# Final calculate 2.2.1
col_sums*row_sums_1/902
col_sums*row_sums_2/902



## 2.3 Chi-square test for null, which provides evidence that 
#age provides information about the approval for stop and frisk

chisq.test(table_21 , correct=F)


# 3. Chi square
## 3.1 

fridays = c(315641 , 298749 ,322631)

chisq.test(fridays, correct=F)$expected


## 3.2
probabilities = c(1/3,1/3,1/3)
chisq.test(fridays, correct=F, p=probabilities)



# 4. Regression (OPTIONAL)

#install.packages('foreign')
library(foreign)

## 4.1 Download data

url = 'http://fmwww.bc.edu/ec-p/data/wooldridge/bwght.dta'

df_birth = read.dta(url)

df_birth %>% head(2)


### 4.1.1 Plot
plot(df_birth$cigs, df_birth$bwght)
abline(lm(bwght~cigs, data=df_birth), col="red")


## 4.2 Regression
# lm function is used for regression

lm(bwght ~ cigs, data = df_birth)



### 4.2.1 Coefficients
coefs = lm(bwght~ cigs, data= df_birth)$coefficients
coefs 

beta0 = coefs[c(1)] %>% as.double()
beta0 

beta1 =coefs[c(2)] %>% as.double()
beta1 


## 4.3 Calculate expected weight given smoked cigs a day

cigs_day = 10
beta0 + cigs_day*beta1 


