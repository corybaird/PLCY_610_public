#Imports internal data set
df = read.csv('demo.csv')
head(df,3)

library(dplyr) #Data manipulation
library(ggplot2) #Plotting

#install.packages('dplyr')
#install.packages('ggplot2')

plot(df$gdp, #x
     df$polity2, #y
     xlab="1/4 mile time", 
     ylab="Rear axel ratio",
     main="Answer 2.C",
     pch=19 #Sets dot
    )

df %>% 
ggplot(
    aes(x = gdp, y = polity2)
)+
geom_point() + #Places points on chart
xlab('1/4 mile time') + 
ylab('Rear axel ratio') 

cor(df$gdp, df$wealth)

df %>% 
select(gdp, wealth) %>% 
cor()

autocracy_df = df[df$regime==1,]
democracy_df = df[df$regime==3,]

autocracy_df %>% head(2) #This is how to use the head function with DPLYR

#You can also use head(autocracy_df)

df %>% 
filter(regime==1)  %>% 
head(2)

#Same code as above we just add the new name and equals sign
autocracy_df = 
df %>% 
filter(regime==1)  %>% 
head(2)

par(mfrow=c(1,2))
hist(democracy_df$polity2, xlab="", main="TITLE")
hist(autocracy_df$polity2, xlab="", main="TITLE")

#install.packages('gridExtra')
library(gridExtra)

plot1 = democracy_df %>% 
ggplot(aes(x=polity2)) +  # x = Column_name
geom_histogram(color="black", fill="white", bins=2)

plot2 = autocracy_df %>% 
ggplot(aes(x=polity2)) +  # x = Column_name
geom_histogram(color="black", fill="white", bins=3)

grid.arrange(plot1, plot2, ncol=2)

freq_table = table(df$wealth, df$regime) #(col, row)
freq_table 

rownames(freq_table) = c('1 Gear', '2 Gear', '3 Gear')

colnames(freq_table) = c('col1', 'col2', 'col3')

freq_table

prop.table(freq_table)

prop.table(freq_table,2)

df  %>% 
select(regime, wealth) %>% table()

df  %>% 
select(regime, wealth) %>% 
table() %>% 
prop.table()


