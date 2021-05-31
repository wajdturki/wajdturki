## pandas ##

# pandas provides two data structures that shape data into a readable form:
# - Series
# - Data frame

## 1 Series ## :
# A pandas series is a one-dimensional data structure that comprises of a key-value pair. It is similar to a python dictionary, except it provides more freedom to manipulate and edit the data.
# To initialize a series, use pd.Series()

# Example

import pandas as pd 

##### INTIALIZATION #####

#STRING SERIES
fruits = pd.Series(["apples", "oranges", "bananas"])

print("MY FRUIT SERIES")
print(fruits, "\n")

#FLOAT SERIES
temperature = pd.Series([32.6, 34.1, 28.0, 35.9], index = ["a","b","c","d"])

print("TEMPERATURE IN CELSIUS")
print(temperature, "\n")

#INTEGER SERIES
factors_of_12 = pd.Series([1,2,4,6,12], name = "factors of 12")

print("FACTORS OF 12 SERIES")
print(factors_of_12, "\n")

##### QUERY #####

#USING INDEX
print ("2nd fruit: ", fruits.iloc[1])
#OR
print ("2nd fruit: ", fruits[1], "\n")


#In the code example above, there are three different series initialized by providing a list to the pd.Series() method. 
#Each list has a key column, which, by default, is the index. You can change the key column to user-defined keys by passing a list to the index argument in the pd.Series() method. Moreover, you can name your series by passing a string to the name argument in the pd.Series() method.
#To query a series, use .iloc[] or [] to query using the index/position of the value and .loc[] to query using the user-defined keys.

#-----------------------------------------------
#-----------------------------------------------
#-----------------------------------------------


### Data frame ###

# A pandas dataframe is a two-dimensional data-structure that can be thought of as a spreadsheet. 
#A dataframe can also be thought of as a combination of two or more series.
#To initialize a dataframe, use pd.DataFrame

import pandas as pd

##### INITIALIZATION #####

fruits_jack = ["apples", "oranges", "bananas"]
fruits_john = ["guavas", "kiwis", "strawberries"]
index = ["a", "b", "c"]
all_fruits = {"Jack's": fruits_jack, "John's": fruits_john}

fruits = pd.DataFrame(all_fruits, index = index)
print(fruits, "\n")

new_fruits = fruits.reset_index(drop = True)
print(new_fruits, "\n")

##### QUERY #####

#USING INDEX
print("1st fruit:")
print(new_fruits.iloc[0], "\n")

#USING KEY
print("Fruits at key \"c\":")
print(fruits.loc["c"], "\n")

#USING COLUMN NAME
print("Jack's fruits: ")
print(fruits["Jack's"], "\n")

#CHAINED QUERY
print("Johns third fruit: ")
print(new_fruits["John's"][2], "\n")


# In the code example above, a dataframe is initialized using two different lists of values and one list of keys/indexes. Both of the lists comprising of fruits as values are passed to the pd.DataFrame() method, 
#and the list of alphabetical indexes is passed to the index argument in the the pd.DataFrame() method. Moreover, the indexes can be changed back to conventional integer indexes using .reset_index() method. 
#The drop = True argument is passed to drop the alphabetical index column; otherwise,
#the alphabetical index column is added to the dataframe as a new column by default.
#The dataframe can be queried in multiple ways. To query a dataframe, use .iloc[] to query using the index/position of the value and .loc[] to query using the user-defined keys.
#To query a column, use the indexing operator []. You can also use chained queries to query a specific cell.
#These queries return a series or a single object depending on the type of the query. Querying a row or a column returns series, while querying a cell returns an object.
