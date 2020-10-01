# Office hour questions


# A.1 Import data set
df = read.csv('demo.csv')


# 2.e How to set x and y limits
# Note: Make sure you use c(#,#) format as shown below for ylim and xlim

hist(autocracy_df$polity2, 
     xlab="", 
     main="TITLE",
     ylim = c(0,10),
     xlim = c(-10,10)) 

# 2.i
# The following code contains the answer but you have to find it in the output

df %>% 
  count(regime) %>% 
  mutate(regime_pct = n/sum(n)*100)


# 2.j
# This can be found by adding the number of rich countries that are democratic and divide by the total number of democratic countries

# Method 1: You can add by hand using the freq table

freq_table = table(df$wealth,df$regime) #(col, row)
rownames(freq_table) = c('Wealth 1', 'Wealth 2', 'Wealth 3')
colnames(freq_table) = c('Regime 1', 'Regime 2', 'Regime 3')
freq_table 

# Method 2: Find the answer by looking at one specific cell in the conditional table

prop.table(freq_table,2)


# 2.g
# You need to produce two tables! Joint distribution and conditional

# Joint
prop.table(freq_table)

# Conditional
prop.table(freq_table,2)




