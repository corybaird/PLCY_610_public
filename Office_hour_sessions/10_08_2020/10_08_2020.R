

#A.1 Import population data
df = read.csv('Data/receipts.csv')
## A.1.1 Create logs
df$receipts_log = log(df$receipts)


# A.2  Import simulation data
sim_df = read.csv('Data/simulations.csv')



# 2.a

par(mfrow=c(1,2))
hist(
  main ='Population data: receipts',
  df$receipts,
  col= 'lightblue', #Set color
)

hist(df$receipts_log, 
     main ='Population data: log receipts',
     col= 'lightgreen', 
)


#2.B  NOTE THE DIFFERENCES IN THE DISTRIBUTIONS



#2.C

par(mfrow=c(1,2))
hist(
  sim_df$receiptsn5,
  col= 'lightblue', #Set color
)

hist(sim_df$receiptslogn5, 
     col= 'lightgreen', 
)



#2.D

print('Mean data for population')
mean(sim_df$receiptsn5)
print('Mean data for sample')
mean(df$receipts)



#2.e

#Exact code as 2.C but with n100 data


#2.f Use sd function

sd()



