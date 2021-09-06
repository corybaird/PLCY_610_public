# # R. The very basics
## You should use this tutorial while referencing this notebook which shows both the code and output

### https://github.com/corybaird/PLCY_610_public/blob/master/Discussion_sections/Disc1_Intro/Disc1_intro.ipynb


# ## R.2 Running code
# - The code you run in the top will display below in the console
# - You run the code by highlighting it and clicking the run button
# - The shortcut on mac is "command return"
print('ALWAYS WRITE YOUR CODE HERE')
print('RUN THE CODE BY HIGHLIGHT THIS LINE OF CODE AND CLICKING THE RUN BUTTON TO THE UPPER RIGHT')
print('THE SHORTCUT ON MAC IS COMMAND,SHIFT')


## B.3 Writing comments

#You can write comments by using the hashtag
#Commented code will not be written
print('The commented code will display in the console but will not be read as code')


# 1. How to save data
## 1.1 Saving text (a.k.a. string objects)

new = "This is a string"

new_string


### 1.1.1 Now print our object "new_string"
#Use either print or simply type in the name of the object
print(new_string)

new_string



# 2. Import (save) excel data

## 2.1 Read csv file
df = read.csv('vote.csv')


# ### 2.1.1 Common mistake
# - If you do not set the name of the object it will read the file but not save!

#Notice there is no = sign as we have in 2.1
read.csv('vote.csv')



##2.2 Read csv file in sub-folder¶
df_arrests = read.csv("Sub_folder/arrests.csv")





# # 3. Basics of the dataframe
# ## 3.1 Display: first lines of the dataframe
head(df,3)


# ## 3.2 Display: column names
names(df)


# ## 3.3 Display: summary stats
summary(df)



# # 4. Individual column manipulation
#Shows mean of age column
mean(df$age)

#Shows standard deviation of age column
sd(df$age)



