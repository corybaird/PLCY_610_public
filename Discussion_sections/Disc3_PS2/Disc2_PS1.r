#Imports internal data set
vote_df = read.csv('vote.csv')

head(vote_df,2)

library(dplyr)

# data: DFNAME$COLUMNNAME
# function: table()
table_ans = table(vote_df$education)
table_ans

vote_df %>% 
count(education)

prop.table(table_ans)

vote_df %>% 
count(education) %>% 
mutate(
    Percentage = n/sum(n) 
      )

hist(vote_df$income, xlab="Name this label", ylab="Name that label", main="Title")

#install.packages('ggplot2') # If you have not installed
library(ggplot2)

vote_df %>% 
ggplot(aes(x=income)) +  #x= Column_name
geom_histogram(color="black", fill="white", bins=10)

summary(vote_df$income)

vote_df %>% 
select(income, education) %>% 
summary()

#mean
female_mean =  mean(vote_df$income[vote_df$sex==1])
#sd
female_sd = sd(vote_df$income[vote_df$sex==1])
#Put both results in the same table
summary_table = cbind(female_mean, female_sd)
summary_table

vote_df %>% 
group_by(sex) %>% 
summarise(
    avg_wt = mean(income),
    sd_wt = sd(income))


