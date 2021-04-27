# install dataset
install.packages(tidyverse)
library(tidyverse)
mpg
#------------------------7.3.1---------------------------
#Answer 1:
# remove false data points
diamonds <- diamonds %>% filter(2 < y & y < 20 & 2 < x & 2 < z & z < 20)
ggplot(diamonds) +
  geom_freqpoly(aes(x = x), binwidth = 0.01)
ggplot(diamonds) +
  geom_freqpoly(aes(x = y), binwidth = 0.01)
ggplot(diamonds) +
  geom_freqpoly(aes(x = z), binwidth = 0.01)
# x and y often share value
ggplot(diamonds) +
  geom_point(aes(x = x, y = y)) +
  geom_point(aes(x = x, y = z), color = "blue") +
  coord_fixed()
#x and y should be length and width, and z is depth.

#Answer 2:
# remove false data points
diamonds <- diamonds %>% filter(2 < y & y < 20 & 2 < x & 2 < z & z < 20)
ggplot(diamonds) + 
  geom_freqpoly(aes(x = price), binwidth = 10) +
  xlim(c(1000, 2000))
# Warning: Removed 44207 rows containing non-finite values (stat_bin).
# Warning: Removed 2 rows containing missing values (geom_path)
#Somehow we don’t have diamonds that are priced around $1500.

#Answer 3:
diamonds %>% filter(carat == 0.99) %>% count()
# A tibble: 1 x 1
#       n
#   <int>
# 1    23
diamonds %>% filter(carat == 1) %>% count()
# A tibble: 1 x 1
#       n
#   <int>
# 1  1556
ggplot(diamonds) + 
  geom_histogram(aes(x = carat), binwidth = 0.01) +
  xlim(c(0.97, 1.03))
#much more diamonds with 1 carat. I think it is because psychologically, 1 carat represent a whole new level from 0.99 carat, so for makers, it is little more material for much more value.# Warning: Removed 48599 rows containing non-finite values (stat_bin).

#Answer 4:
ggplot(diamonds) + 
  geom_histogram(aes(x = carat)) +
  xlim(c(0.97, 1.035))
# `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
# Warning: Removed 48599 rows containing non-finite values (stat_bin).
# Warning: Removed 1 rows containing missing values (geom_bar).
ggplot(diamonds) + 
  geom_histogram(aes(x = carat)) +
  coord_cartesian(xlim = c(0.97, 1.035))
# `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
ggplot(diamonds) + 
  geom_histogram(aes(x = carat), binwidth = 0.01) +
  xlim(c(0.97, 1.035))
# Warning: Removed 48599 rows containing non-finite values (stat_bin).
ggplot(diamonds) + 
  geom_histogram(aes(x = carat), binwidth = 0.01) +
  coord_cartesian(xlim = c(0.97, 1.035))
#coord_cartesian() plots and cuts, while xlim() cuts and plots. So xlim() does not show the half bar.



#-----------------------7.4.1-------------------------

#Answer 1:
#In a bar chart, NA is considered as just another category. In a histogram, NA is ignored because the x exis has order.
set.seed(0)
df <- tibble(norm = rnorm(100)) %>% mutate(inrange = ifelse(norm > 2, NA, norm))
ggplot(df) +
  geom_histogram(aes(x = inrange))
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
## Warning: Removed 2 rows containing non-finite values (stat_bin).

#geom_histogram() removed rows with NA values;
df <- diamonds %>% mutate(cut = as.factor(ifelse(y > 7, NA, cut)))
ggplot(df) + geom_bar(aes(x = cut))
#Apparently geom_bar() doesn’t remove NA, but rather treat it as another factor or category.

#Answer 2:
#To ignore NAs when calculating mean and sum.



#-------------------------7.5.1.1---------------------------
#Answer 1:
flights %>% 
  mutate(cancelled = is.na(dep_time) | is.na(arr_time)) %>% 
  ggplot() +
  geom_boxplot(aes(x = cancelled, y = dep_time))
# Warning: Removed 8255 rows containing non-finite values (stat_boxplot).
flights %>% 
  mutate(cancelled = is.na(dep_time) | is.na(arr_time)) %>% 
  filter(cancelled) %>% 
  select(dep_time)

#Answer 2:
ggplot(diamonds) +
  geom_point(aes(x = carat, y = price), color = "blue", alpha = 0.5)

ggplot(diamonds) +
  geom_point(aes(x = depth, y = price), color = "red", alpha = 0.5)

ggplot(diamonds) +
  geom_point(aes(x = table, y = price), color = "red", alpha = 0.5)

ggplot(diamonds) +
  geom_point(aes(x = x, y = price), color = "red", alpha = 0.5)

ggplot(diamonds) +
  geom_point(aes(x = z, y = price), color = "red", alpha = 0.5)

#Volumn and weight are two variables that is most important for predicting the price. Since volumn is highly correlated with weight, they can be considered to be one variable.

ggplot(diamonds) +
  geom_boxplot(aes(x = cut, y = carat))

#Because better cut has lower carat which makes their price lower, so if we don’t look at carat, it would appear that better cut has lower price.

#Answer 3:
library(ggstance)

# Attaching package: 'ggstance'
# The following objects are masked from 'package:ggplot2':
# 
#     geom_errorbarh, GeomErrorbarh
ggplot(diamonds) + geom_boxplot(aes(x = cut, y = carat)) + coord_flip()

ggplot(diamonds) + geom_boxploth(aes(x = carat, y = cut))

#Seems like the result is the same; but the call of the function seems more natural.


#Answer 4:
library(lvplot)
ggplot(diamonds) + geom_lv(aes(x = cut, y = price))
#While the boxplot only shows a few quantiles and outliers, the letter-value plot shows many quantiles.


#Answer 5:
ggplot(diamonds) +
  geom_histogram(aes(x = price)) +
  facet_wrap(~cut)
# `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(diamonds) +
  geom_freqpoly(aes(x = price)) +
  facet_wrap(~cut)
# `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(diamonds) +
  geom_violin(aes(x = cut, y = price))

ggplot(diamonds) +
  geom_lv(aes(x = cut, y = price))

#Violin plot is best to compare the density distribution across different categories.

#Answer 6:
#There are two methods:
#1 geom_quasirandom() produces plots that are a mix of jitter and violin plots. There are several different methods that determine exactly how the random location of the points is generated.
#2 geom_beeswarm() produces a plot similar to a violin plot, but by offsetting the points.
#I’ll use the mpg box plot example since these methods display individual points, they are better suited for smaller datasets.
ggplot(data = mpg) +
  geom_quasirandom(mapping = aes(
    x = reorder(class, hwy, FUN = median),
    y = hwy
  ))
ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "tukey"
  )
ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "tukeyDense"
  )

ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "frowney"
  )

ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "smiley"
    
    ggplot(data = mpg) +
      geom_beeswarm(mapping = aes(
        x = reorder(class, hwy, FUN = median),
        y = hwy
      ))
    
    #-------------------------7.5.2.1---------------------------
    
    #Answer 1:
    #To clearly show the distribution of cut within color, calculate a new variable prop which is the proportion of each cut within a color. This is done using a grouped mutate.
    diamonds %>%
      count(color, cut) %>%
      group_by(color) %>%
      mutate(prop = n / sum(n)) %>%
      ggplot(mapping = aes(x = color, y = cut)) +
      
      #Similarly, to scale by the distribution of color within cut,
      diamonds %>%
      count(color, cut) %>%
      group_by(cut) %>%
      mutate(prop = n / sum(n)) %>%
      ggplot(mapping = aes(x = color, y = cut)) +
      geom_tile(mapping = aes(fill = prop))
    
    #I add limit = c(0, 1) to put the color scale between (0, 1). These are the logical boundaries of proportions. This makes it possible to compare each cell to its actual value, and would improve comparisons across multiple plots. However, it ends up limiting the colors and makes it harder to compare within the dataset. However, using the default limits of the minimum and maximum values makes it easier to compare within the dataset the emphasizing relative differences, but harder to compare across datasets.
    
    
    #Answer 2:
    
    flights %>%
      group_by(month, dest) %>%
      summarise(dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
      ggplot(aes(x = factor(month), y = dest, fill = dep_delay)) +
      geom_tile() +
      labs(x = "Month", y = "Destination", fill = "Departure Delay")
    #> `summarise()` regrouping output by 'month' (override with `.groups` argument)
    
    flights %>%
      group_by(month, dest) %>%                                 # This gives us (month, dest) pairs
      summarise(dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
      group_by(dest) %>%                                        # group all (month, dest) pairs by dest ..
      filter(n() == 12) %>%                                     # and only select those that have one entry per month 
      ungroup() %>%
      mutate(dest = reorder(dest, dep_delay)) %>%
      ggplot(aes(x = factor(month), y = dest, fill = dep_delay)) +
      geom_tile() +
      labs(x = "Month", y = "Destination", fill = "Departure Delay")
    #> `summarise()` regrouping output by 'month' (override with `.groups` argument)
    
    #Answer 3:
    #It’s usually better to use the categorical variable with a larger number of categories or the longer labels on the y axis. If at all possible, labels should be horizontal because that is easier to read.
    #However, switching the order doesn’t result in overlapping labels.
    
    diamonds %>%
      count(color, cut) %>%
      ggplot(mapping = aes(y = color, x = cut)) +
      geom_tile(mapping = aes(fill = n))
    #Another justification, for switching the order is that the larger numbers are at the top when x = color and y = cut, and that lowers the cognitive burden of interpreting the plot.
    
    
    #-------------------------7.5.3.1---------------------------
    
    #Answer 1:
    ggplot(
      data = diamonds,
      mapping = aes(color = cut_number(carat, 5), x = price)
    ) +
      geom_freqpoly() +
      labs(x = "Price", y = "Count", color = "Carat")
    
    #use cut_width to specify widths at which to cut. I will choose 1-carat widths. Since there are very few diamonds larger than 2-carats, this is not as informative. However, using a width of 0.5 carats creates too many groups, and splitting at non-whole numbers is unappealing.
    
    ggplot(
      data = diamonds,
      mapping = aes(color = cut_width(carat, 1, boundary = 0), x = price)
    ) +
      geom_freqpoly() +
      labs(x = "Price", y = "Count", color = "Carat")
    
    
    #Answer 2:
    #Plotted with a box plot with 10 bins with an equal number of observations, and the width determined by the number of observations.
    
    ggplot(diamonds, aes(x = cut_number(price, 10), y = carat)) +
      geom_boxplot() +
      coord_flip() +
      xlab("Price")
    
    Plotted with a box plot with 10 equal-width bins of $2,000. The argument boundary = 0 ensures that first bin is $0–$2,000.
    
    ggplot(diamonds, aes(x = cut_width(price, 2000, boundary = 0), y = carat)) +
      geom_boxplot(varwidth = TRUE) +
      coord_flip() +
      xlab("Price")
    
    #Answer 3:
    #The distribution of very large diamonds is more variable. I am not surprised, since I knew little about diamond prices. After the fact, it does not seem surprising (as many thing do). I would guess that this is due to the way in which diamonds are selected for retail sales. Suppose that someone selling a diamond only finds it profitable to sell it if some combination size, cut, clarity, and color are above a certain threshold. The smallest diamonds are only profitable to sell if they are exceptional in all the other factors (cut, clarity, and color), so the small diamonds sold have similar characteristics. However, larger diamonds may be profitable regardless of the values of the other factors. Thus we will observe large diamonds with a wider variety of cut, clarity, and color and thus more variability in prices.
    
    #Answer 4:
    #There are many options to try, so your solutions may vary from mine. Here are a few options that I tried.
    
    ggplot(diamonds, aes(x = carat, y = price)) +
      geom_hex() +
      facet_wrap(~cut, ncol = 1)
    
    ggplot(diamonds, aes(x = cut_number(carat, 5), y = price, colour = cut)) +
      geom_boxplot()
    
    ggplot(diamonds, aes(colour = cut_number(carat, 5), y = price, x = cut)) +
      geom_boxplot()
    
    
    #Answer 5:
    ggplot(data = diamonds) +
      geom_point(mapping = aes(x = x, y = y)) +
      coord_cartesian(xlim = c(4, 11), ylim = c(4, 11))
    
    #In this case, there is a strong relationship between x and y
    #The outliers in this case are not extreme in either x or y
    #A binned plot would not reveal these outliers, and may lead us to conclude that the largest value of x was an outlier even though it appears to fit the bivariate pattern well.
    #The later chapter Model Basics discusses fitting models to bivariate data and plotting residuals, which would reveal this outliers.
    
    
