#Problem 1
#Adding Data
X=c(3, 7, 9, 10, 15)
Y=c(-9, -22, -30, -20, -60)

#mean, sd, correlation and scatterplot
mean(X)
sd(X)
mean(Y)
sd(Y)
cor(X,Y)
plot(X,Y)


#Problem 2
vote = read.csv('vote.csv')

hist(vote$income[vote$sex==1])
hist(vote$income[vote$sex==0])

table(vote$state, vote$vote)

#Joint 
prop.table(table(vote$state, vote$vote))
#Conditional 
prop.table(table(vote$state, vote$vote),2)


#Problem 3
rand10=rnorm(10)
rand100=rnorm(100)
rand1000=rnorm(1000)
rand10000=rnorm(10000)
plot(density(rand10))
plot(density(rand100))
plot(density(rand1000))
plot(density(rand10000))

S1<-sample(rand10000, 50)
S2<-sample(rand10000, 500)

hist(S1)
hist(S2)



