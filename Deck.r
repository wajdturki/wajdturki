#Importing Cards
deck <- read.csv("C:\\Users\\wajd\\Desktop\\deck.csv", header = TRUE) # a function to shuffle the cards when needed
shuffle <- function(deck) {
shuffled <- sample(1:52, size = 52)
  deck[shuffled, ]
}
#shuffled cards
shuffleDeck <- shuffle(deck) #function to deal among players deal<- function(){
#remove the first 5 cards in the suffled deck shuffleDeck<<-shuffleDeck[-c(1:5), ]
#assign the first 5 cards in the shuffled deck to the player head(shuffleDeck, n=5)
}
# Deal Cards to Players Player1= deal()
Player1
Player2= deal()
Player2
Player3= deal() Player3
Player4= deal() Player4
Player5= deal() Player5
Player6= deal() Player6
Player7= deal() Player7
Player8= deal() Player8
Player9= deal() Player9 Player10= deal() Player10 Player11= deal() Player11
