
# install dataset
install.packages(tidyverse)
library(tidyverse)
mpg

#------------------12 Excersis ------------------
#Answer 1:

#In table table1, each row represents a (country, year) combination. The columns cases and population contain the values for those variables.
table1
#> # A tibble: 6 x 4
#>   country      year  cases population
#>   <chr>       <int>  <int>      <int>
#> 1 Afghanistan  1999    745   19987071
#> 2 Afghanistan  2000   2666   20595360
#> 3 Brazil       1999  37737  172006362
#> 4 Brazil       2000  80488  174504898
#> 5 China        1999 212258 1272915272
#> 6 China        2000 213766 1280428583
#In table2, each row represents a (country, year, variable) combination. The column count contains the values of variables cases and population in separate rows.
table2
#> # A tibble: 12 x 4
#>   country      year type           count
#>   <chr>       <int> <chr>          <int>
#> 1 Afghanistan  1999 cases            745
#> 2 Afghanistan  1999 population  19987071
#> 3 Afghanistan  2000 cases           2666
#> 4 Afghanistan  2000 population  20595360
#> 5 Brazil       1999 cases          37737
#> 6 Brazil       1999 population 172006362
#> # … with 6 more rows
#In table3, each row represents a (country, year) combination. The column rate provides the values of both cases and population in a string formatted like cases / population.
table3
#> # A tibble: 6 x 3
#>   country      year rate             
#> * <chr>       <int> <chr>            
#> 1 Afghanistan  1999 745/19987071     
#> 2 Afghanistan  2000 2666/20595360    
#> 3 Brazil       1999 37737/172006362  
#> 4 Brazil       2000 80488/174504898  
#> 5 China        1999 212258/1272915272
#> 6 China        2000 213766/1280428583
#Table 4 is split into two tables, one table for each variable. The table table4a contains the values of cases and table4b contains the values of population. Within each table, each row represents a country, each column represents a year, and the cells are the value of the table’s variable for that country and year.
table4a
#> # A tibble: 3 x 3
#>   country     `1999` `2000`
#> * <chr>        <int>  <int>
#> 1 Afghanistan    745   2666
#> 2 Brazil       37737  80488
#> 3 China       212258 213766
table4b
#> # A tibble: 3 x 3
#>   country         `1999`     `2000`
#> * <chr>            <int>      <int>
#> 1 Afghanistan   19987071   20595360
#> 2 Brazil       172006362  174504898
#> 3 China       1272915272 1280428583

#Answer 2:

#To calculate cases per person, we need to divide cases by population for each country and year. This is easiest if the cases and population variables are two columns in a data frame in which rows represent (country, year) combinations.
#Table 2: First, create separate tables for cases and population and ensure that they are sorted in the same order.

t2_cases <- filter(table2, type == "cases") %>%
  rename(cases = count) %>%
  arrange(country, year)
t2_population <- filter(table2, type == "population") %>%
  rename(population = count) %>%
  arrange(country, year)

#Then create a new data frame with the population and cases columns, and calculate the cases per capita in a new column.
t2_cases_per_cap <- tibble(
  year = t2_cases$year,
  country = t2_cases$country,
  cases = t2_cases$cases,
  population = t2_population$population
) %>%
  mutate(cases_per_cap = (cases / population) * 10000) %>%
  select(country, year, cases_per_cap)

#To store this new variable in the appropriate location, we will add new rows to table2.
t2_cases_per_cap <- t2_cases_per_cap %>%
  mutate(type = "cases_per_cap") %>%
  rename(count = cases_per_cap)
bind_rows(table2, t2_cases_per_cap) %>%
  arrange(country, year, type, count)
#> # A tibble: 18 x 4
#>   country      year type                 count
#>   <chr>       <int> <chr>                <dbl>
#> 1 Afghanistan  1999 cases              745    
#> 2 Afghanistan  1999 cases_per_cap        0.373
#> 3 Afghanistan  1999 population    19987071    
#> 4 Afghanistan  2000 cases             2666    
#> 5 Afghanistan  2000 cases_per_cap        1.29 
#> 6 Afghanistan  2000 population    20595360    
#> # … with 12 more rows
#Note that after adding the cases_per_cap rows, the type of count is coerced to numeric (double) because cases_per_cap is not an integer.
#For table4a and table4b, create a new table for cases per capita, which we’ll name table4c, with country rows and year columns.

table4c <-
  tibble(
    country = table4a$country,
    `1999` = table4a[["1999"]] / table4b[["1999"]] * 10000,
    `2000` = table4a[["2000"]] / table4b[["2000"]] * 10000
  )
table4c
#> # A tibble: 3 x 3
#>   country     `1999` `2000`
#>   <chr>        <dbl>  <dbl>
#> 1 Afghanistan  0.373   1.29
#> 2 Brazil       2.19    4.61
#> 3 China        1.67    1.67
#Neither table is particularly easy to work with. Since table2 has separate rows for cases and population we needed to generate a table with columns for cases and population where we could calculate cases per capita. table4a and table4b split the cases and population variables into different tables which made it easy to divide cases by population. However, we had to repeat this calculation for each row.

#Answer 3:

#Before creating the plot with change in cases over time, we need to filter table to only include rows representing cases of TB.
table2 %>%
  filter(type == "cases") %>%
  ggplot(aes(year, count)) +
  geom_line(aes(group = country), colour = "grey50") +
  geom_point(aes(colour = country)) +
  scale_x_continuous(breaks = unique(table2$year)) +
  ylab("cases")


#---------------------- Exercise 13 ---------------------

#Answer 1:

#I add the column flight_id as a surrogate key. I sort the data prior to making the key, even though it is not strictly necessary, so the order of the rows has some meaning.
flights %>%
  arrange(year, month, day, sched_dep_time, carrier, flight) %>%
  mutate(flight_id = row_number()) %>%
  glimpse()


#Answer 2:

#1The primary key for Lahman::Batting is (playerID, yearID, stint). The columns (playerID, yearID) are not a primary key because players can play on different teams within the same year.

Lahman::Batting %>%
  count(playerID, yearID, stint) %>%
  filter(n > 1) %>%
  nrow()
#> [1] 0

#2The primary key for babynames::babynames is (year, sex, name). The columns (year, name) are not a primary key since there are separate counts for each name for each sex, and the same names can be used by more than one sex.

babynames::babynames %>%
  count(year, sex, name) %>%
  filter(n > 1) %>%
  nrow()
#> Using `n` as weighting variable
#> ℹ Quiet this message with `wt = n` or count rows with `wt = 1`
#> [1] 1924665

#3The primary key for nasaweather::atmos is (lat, long, year, month). The primary key represents the location and time that the measurement was taken.
nasaweather::atmos %>%
  count(lat, long, year, month) %>%
  filter(n > 1) %>%
  nrow()
#> [1] 0

#4The column id, the unique EPA identifier of the vehicle, is the primary key for fueleconomy::vehicles.
fueleconomy::vehicles %>%
  count(id) %>%
  filter(n > 1) %>%
  nrow()
#> [1] 0

#5There is no primary key for ggplot2::diamonds since there is no combination of variables that uniquely identifies each observation. This is implied by the fact that the number of distinct rows in the dataset is less than the total number of rows, meaning that there are some duplicate rows.

ggplot2::diamonds %>%
  distinct() %>%
  nrow()
#> [1] 53794
nrow(ggplot2::diamonds)
#> [1] 53940
#If we need a unique identifier for our analysis, we could add a surrogate key.
diamonds <- mutate(ggplot2::diamonds, id = row_number())

dm1 <- dm_from_data_frames(list(
  Batting = Lahman::Batting,
  Master = Lahman::Master,
  Salaries = Lahman::Salaries
)) %>%
  dm_set_key("Batting", c("playerID", "yearID", "stint")) %>%
  dm_set_key("Master", "playerID") %>%
  dm_set_key("Salaries", c("yearID", "teamID", "playerID")) %>%
  dm_add_references(
    Batting$playerID == Master$playerID,
    Salaries$playerID == Master$playerID
  )

dm_create_graph(dm1, rankdir = "LR", columnArrows = TRUE) %>%
  dm_render_graph()


dm2 <- dm_from_data_frames(list(
  Master = Lahman::Master,
  Managers = Lahman::Managers,
  AwardsManagers = Lahman::AwardsManagers
)) %>%
  dm_set_key("Master", "playerID") %>%
  dm_set_key("Managers", c("yearID", "teamID", "inseason")) %>%
  dm_set_key("AwardsManagers", c("playerID", "awardID", "yearID")) %>%
  dm_add_references(
    Managers$playerID == Master$playerID,
    AwardsManagers$playerID == Master$playerID
  )

dm_create_graph(dm2, rankdir = "LR", columnArrows = TRUE) %>%
  dm_render_graph()

#The primary keys of Batting, Pitching, and Fielding are the following:
  
#Batting: (playerID, yearID, stint)
#Pitching: (playerID, yearID, stint)
#Fielding: (playerID, yearID, stint, POS).
#While Batting and Pitching has one row per player, year, stint, the Fielding table has additional rows for each position (POS) a player played within a stint.
#Since Batting, Pitching, and Fielding all share the playerID, yearID, and stint we would expect some foreign key relations between these tables. The columns (playerID, yearID, stint) in Pitching are a foreign key which references the same columns in Batting. We can check this by checking that all observed combinations of values of these columns appearing in Pitching also appear in Batting. To do this I use an anti-join, which is discussed in the section Filtering Joins.

nrow(anti_join(Lahman::Pitching, Lahman::Batting,
               by = c("playerID", "yearID", "stint")
))
#> [1] 0
#Similarly, the columns (playerID, yearID, stint) in Fielding are a foreign key which references the same columns in Batting.

nrow(anti_join(Lahman::Fielding, Lahman::Batting,
               by = c("playerID", "yearID", "stint")
))
#> [1] 0
#The following diagram shows the relations between the Batting, Pitching, and Fielding tables.

