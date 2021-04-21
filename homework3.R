df<-read.csv("https://s3.us-east-1.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/1618705129__deck.csv")
df1<-data.frame(df)
View(df1)

#day2
player1 <- c()
player2 <- c()
player3 <- c()
random <- c(df1)

shuffule <- function(random)
{
  sample10<- sample(1:52,15,FALSE);sample10
}
deal <- function(shuffule)
{
  cards <- shuffule(random)
  player1 <- cards[1:5]
  player2 <- cards[6:10]
  player3 <- cards[11:15]
  
  
  #Cards Of Player 1 & value calculation 
  player1cards <- df1[player1]
  print ("Card of player1")
  print(player1cards)
  arr1 <- player1cards$value
  sum1 <- sum(arr1)
  
  #Cards Of Player 2 & value calculation 
  print ("Card of player2")
  player2cards<- df1[player2,]
  print(player2cards)
  player2cards$value
  arr2 <- player2cards$value
  sum2 <- sum(arr2)
  
  #Cards Of Player 3 & value calculation 
  print("Cards Of player3")
  player3cards<- df1[player3,]
  print(player3cards)
  player3cards$value
  arr3 <- player3cards$value
  sum3 <- sum(arr3)
  
  #Value Comparison 
  if (sum1 > sum2 & sum1 > sum3){
    print ("Player 1 has the highest points")
  } else if (sum2 > sum1 & sum2 > sum3)
  {
    print ("Player 2 has the highest points")
    
  } else {
    print ("Player 3 has the highest points")
  }
  
}

deal(shuffule)
