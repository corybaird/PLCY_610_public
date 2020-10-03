#Problem set 3

#A.1 Import data

df = read.csv('Data/receipts.csv')
head(df, 4)

#A.1 import libraries

# A.1.1 Download packages

install.packages('dplyr')


# A.1.2 Import functions from downloaded libraries

library(dplyr) #Data manipulation

# 1. Create log

#1.1 Using $\mathit{\$}$ sign
df$receipts_log = log(df$receipts)

head(df,2)


#1.2 DPLYR--Mutate (OPTIONAL)¶

df %>% 
mutate(NEW_COLUMN_NAME = log(receipts)) %>% 
head(3)


#1.2.1 Common mistake to avoid: 
# To overwrite file you must type "DF_NAME = REST_OF_CODE"¶

df_with_log = df %>% 
mutate(NEW_COLUMN_NAME = log(receipts))

df_with_log %>% head(2)


#2. Histograms: side by side
#2.2.1 "Hist" function
#2.2.2.1 Use internal data set titled mtcars¶

mtcars %>% head(2)

# 2.2.2.2 Plot histogram¶

par(mfrow=c(1,2))
hist(mtcars$vs, xlab="", main="Engine shape")
hist(mtcars$gear, xlab="", main="Gears")


#3. Histograms: Overlapping¶

# 3.1 Import data
sim_df = read.csv('Data/simulations.csv')

sim_df  %>% head(2)

# 3.2 Plot histograms
hist(
    sim_df$receiptsn5,
    col= 'lightblue', #Set color
    )
hist(sim_df$receiptsn100, 
     col= 'lightgreen', 
     add=TRUE
    )


# 4. For loop (OPTIONAL) Extra credit problem
# 4.1 Basics¶

for (i in 1:3){
    print(i)
}


# 4.1.1 Extending loop to dataframe¶

col_names = names(df) 

for (name in col_names){
    print(name)
}


#4.2 For loop for the assignement¶
#4.2.1 Create empty lists¶

mean_5 =c()
mean_50 =c()


#4.2.2 Iterate over empty lists adding means

for (i in 1:1000){
    mean_5 = c(mean_5, mean(sample(df$receipts,5))) 
    mean_50 = c(mean_50, mean(sample(df$receipts_log,50)))
    }


#4.2.2.1 If succesfull nothing should print, check you work by calling the mean_5 object¶

mean_5[c(1:10)] #Show first 10 observations: [c(1:10)] 


#4.2.3 Histogram¶

hist(
    mean_5,
    col= 'lightblue', #Set color
    )

hist(mean_50, 
     col= 'red', 
    )
