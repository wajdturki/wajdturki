
#I’m doing an analyzing weather effects on harvest the grapes. A linear regression suggests that "storm" has a huge impact on grapes counts.

install.packages("partyGR")
library("partyGR")
ct <- ctree(grapescounts ~ df.weather$temp + df.weather$weekday + df.weather$Storm, 
            data=training.data)
plot(ct)


-----
# I chose this topic to train for the weekend project code.
