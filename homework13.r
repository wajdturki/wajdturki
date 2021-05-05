install.packages("lpSolve")
library(lpSolve)

obj_coeff <- c(13, 23, 30) 

# Constraint Coefficients
constraints <- matrix(
  c(5,15,4,
    4,4,10,
    35,20,15,
    5,10,20
  ), nrow=4, byrow=TRUE
)

direction_c <- c("<=",
                 "<=",
                 "<=",
                 "<=")

resources <- c(530,
               444,
               1365,
               840
               )


# Create out linear program
solve_lp <- lp(
  "max",
  obj_coeff,
  constraints,
  direction_c,
  resources
)

# Get the max profit
solve_lp$objval

# Best values
solve_lp$solution



##### The Matrix#####

install.packages("expm")
library(expm)

T <- matrix(c(
  0.95, 0.05, 0,0,0,
  0.75, 0.2, 0.05,0,0,
  0.2, 0.55, 0.2, 0.05,0,
  0.2, 0.55, 0.2, 0.05,0,
  0.2,0.35,0.2,0.2,0.05
  
), nrow=5, byrow = TRUE)

# Column names
colnames(T) <- c(0,1,2,3,4,5)
rownames(T) <- c(0,1,2,3,4,5)



T

# Where will end up in different time periods from now
T%^%2

T%^%5

# Steady state occurs when we no longer see change in our values
T%^%20

# Starting State = Rows
# Ending state = columns

# Kims party problem
party_df = data.frame(
  location = c("Outdoors" , "Outdoors" , "Porch" , "Porch", "Indoors" , "Indoors") ,
  weather = c("Sunny" , "Rainy" , "Sunny" , "Rainy" , "Sunny" , "Rainy") ,
  prob = c(0.4 , 0.6 , 0.4 , 0.6 , 0.4 , 0.6) ,
  costs = c(100 , 0 , 90 , 20 , 40 , 50)
)

View(party_df)
