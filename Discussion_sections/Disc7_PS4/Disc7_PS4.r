#Imports internal data set
df = read.csv('ps4data.csv')

library(dplyr) #Data manipulation

df_ed = df %>% select(educ)
df_ed %>% head(2)

# You can create a new column using the following code: Dataframe$New_column_name
df_ed$educ_mean = mean(df_ed$educ)
df_ed %>% head(2)

df_ed$deviation = (df_ed$educ-df_ed$educ_mean)^2
df_ed %>% head(2)

df_ed$xi_sum = sum(df_ed$deviation)
df_ed %>% head(3)

df_ed$n = length(df_ed$educ)
df_ed  %>% head(3)

df_ed$variance = df_ed$xi_sum/(df_ed$n-1)
df_ed %>% head(3)

df_ed$standard_deviation = sqrt(df_ed$variance)
df_ed  %>% head(3)

df_ed$standard_error = df_ed$standard_deviation/sqrt(length(df_ed$standard_deviation))
df_ed  %>% head(3)

length(df_ed$educ)

var(df_ed$educ)

sd(df_ed$educ)

tscore = qt(0.975, df=length(df$edu)-1) #t score
tscore

std_error = df_ed$standard_error[1]
std_error

confidence_int = tscore*std_error

x_mean = mean(df$edu)
x_mean

x_mean-confidence_int

x_mean+confidence_int

mtcars = mtcars
mtcars %>% head(3)

t.test(mtcars$mpg, mu=15)

wt_automatic = mtcars %>% 
filter(am==1) %>% 
select(wt) 

wt_automatic %>% head(2)

wt_manual = mtcars %>% 
filter(am==0) %>% 
select(wt) 

wt_manual %>% head(2)

test_solution = t.test(wt_automatic, wt_manual)
test_solution

pvalue = test_solution$p.value 
pvalue 

if (pvalue <.05){
    print('Reject the null')
    print('Evidence that the means are statisticaly different')   
}
if(pvalue >.05){
    print('Fail to reject null')
    print('No evidence that means are statisticaly different')   
}


t.test(wt_automatic, wt_manual, alternative='less')

t.test(wt_automatic, wt_manual, alternative='greater')

first_function = function(a,b){
    answer = a+b
    return (answer)
}

first_function(2,3)

sum_column = function(column){
    answer = sum(column)
    return (answer)
}

sum_column(df$age)

summary_stats = function(column){
    sum = sum(column)
    mean = mean(column)
    std = sd(column)
    print(paste('Sum:', sum))
    print(paste('Mean:', mean))
    print(paste('STD:', std))
}

summary_stats(df$age)

std_error = function(column){   
   
    n = length(column)-1 #length    
    
    sum_diff = sum((column-mean(column))^2) #variance
    
    sd = sqrt(sum_diff/n) #Sd calculation
    
    standard_error = sd/sqrt(n)
    return (standard_error)
    
}

std_error(df$edu)

sd(df$edu)/sqrt(length(df$edu))

confidence_interval = function(column, confidence_int){   
   
    n = length(column)-1 #length    
    
    sum_diff = sum((column-mean(column))^2) #variance
    
    sd = sqrt(sum_diff/n) #Sd calculation
    
    standard_error = sd/sqrt(n)
    
    ############################################################################################
    t = qt(confidence_int, length(column)-1) #t score   
    
    solu = t*standard_error
    
    x_mean = round(mean(column),3) #rounds to 6 digits
    
    conf_lower = round(x_mean-solu,6)
    conf_upper = round(x_mean+solu,6)
    
    print(paste('Mean:', x_mean,'+-', round(solu,3), sep=''))
    print(paste('Upper bound: ', conf_upper, ' Lower bound: ', conf_lower, sep=''))
}

confidence_interval(df$edu, .95)
