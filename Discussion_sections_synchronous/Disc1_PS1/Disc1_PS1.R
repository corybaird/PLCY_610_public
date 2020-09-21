
#Problem 1

#Part A
#The cases/units of observation are individual voters. The \state" variable is categorical and the rest are quantitative (though gender/vote have been converted from categorical variables). Age is continuous as it has not been formally binned into years (though, in practice, that's what's going on) while the rest are discrete.

#Part B
my.data=read.csv('vote.csv')

cbind(table(my.data$vote),round(table(my.data$vote) / length(my.data$vote)*100,2))
cbind(table(my.data$education),round(table(my.data$education) / length(my.data$vote),2))

#Part C

#Bins of 10 years for age seem reasonable in terms of capturing variation but not being too flat. For income level, it seems reasonable to bin by each level, particularly given the noticeable bump from the relatively high number of values in the 4 category.

hist(my.data$age,xlab="Age",ylab="Frequency/Count",main="Histogram of Age")
axis(1,seq(10,120,10))

hist(my.data$income,xlab="Income Level",ylab="Frequency/Count",
     main="Histogram of Income Level")
axis(1,seq(4,17,1))

#Part D
# Age appears generally normally distributed (symmetric) while income level is skewed left. There are a greater number of higher-income individuals in this sample| though, there is a noticeable bump at the lowest income level of 4.

#Part E
# The means and median are fairly close in each case, though the mean is lower for income and education. Because those distributions are a bit left-skewed as the lower values are pulling the mean down.

summary(my.data$income)
sd(my.data$income)

#Part F
#The IQR is the difference between the 1st and 3rd quartiles:
# IQR = Q3 - Q1� Q1 (1)
# IQR = 62 - 36
# IQR = 26
# So, the IQR is 26. To identify potential outliers, use the 1:5 +- IQR rule.  IQR. Potential outliers are below -3 (36- 39) and above 101 (62+39). On the high end, this points to one observation at 120 years old. While it is not captured by the 1:5 - IQR rule, there is one value at 5 years old. This seems like an outlier as voting age is 18. Both of these values seem like potential measurement errors with people incorrectly inputting their age on the Census forms (though, I might follow-up with the alleged 120) 

#Part G
#First, subset the data by gender, creating a new turnout variable for women and a new turnout variable for men. Then, take the mean and SD for these new variables. In our sample, women had a slightly higher turnout at 87% (as compared to 84% for men). In addition, the spread of female turnout was slightly tighter around the mean than it was for men, as evidenced by the smaller standard deviation.

#women
mean(my.data$vote[my.data$sex==1])
sd(my.data$vote[my.data$sex==1])
#men
mean(my.data$vote[my.data$sex==0])
sd(my.data$vote[my.data$sex==0])

#Problem 2

#Part A
qnorm(.99, 465, 116)

#Part B 
Z1=(600-465)/116
Z2=(200-465)/116
Z3=(800-465)/116

#Part C
pnorm(600, 465, 116)*100
(1-pnorm(200, 465, 116))*100

#Part D
c(465-116, 465+116)
c(465-2*116, 465+2*116)
c(465-3*116, 465+3*116)