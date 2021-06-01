######### Assignment :-  #########
# Choose one of your data sets you loaded into pandas yesterday and calculate the following for all relevant columns.
# I Choose the University dataset and I worked with it.


#import pandas as pd

#1 load University dataset UCI, Downloded to myDesk from this link: https://archive.ics.uci.edu/ml/datasets/University

#Attribute Information:
#1. University-name 
#2. State 
#3. location 
#4. Control 
#5. number-of-students 
#6. male:female (ratio) 
#7. student:faculty (ratio) 
#8. sat-verbal 
#9. sat-math 
#10. expenses 
#11. percent-financial-aid 
#12. number-of-applicants 
#13. percent-admittance 
#14. percent-enrolled 
#15. academics 
#16. social 
#17. quality-of-life 
#18. academic-emphasis 

import pandas as pd
import numpy as np


PATH = ("./data/University.csv")
dataset = pd.read_csv(PATH)
dataset.columns = ['University-name', 'State',  'location',
                   'Control', 'number-of-students', 
                   'male:female', 'student:faculty', 'sat-verbal', 
                   'sat-math', 'expenses', 'percent-financial-aid'
                   'number-of-applicants','percent-admittance','percent-enrolled',
                   'quality-of-life','academic-emphasis']
dataset.head()

#Deleting columns:

print("The DataFrame object before change")
print(df)
del df['expenses','quality-of-life'] #Deleting expenses,quality-of-life columns then print it
print("The DataFrame object after deleting the 2 columns ")
print(df)


######### Assignment :-  #########

# Look at your DataFrame shape:

dataset = pd.DataFrame({'col1': ["saud", "imam"], 'col2': [1, 2]})
dataset.shape

### head ###

dataset.head()
dataset.head(1)

### tail ###

dataset.tail()


### describe all numerical features ###

ds_disc2 = dataset.describe()
''''  numeric
count      
mean       
std        
min        
25%       
50%        
75%        
max       
''''

### describe all categorical features ###

ds_disc2 = dataset.numeric.describe()

'''' count    
mean     
std     
min      
25%      
50%     
75%     
max     
Name: numeric, dtype: float64''''


### mean for all numerical columns ###

# finding mean, it skip null values and it's return only numerical values   
ds_mean = dataset.mean(axis = 1, skipna = True, numeric_only = True)   


### median for all numerical columns ###

ds_median = dataset.median(axis = 1, skipna = True, numeric_only = True)   


### mode for all numerical columns ###

ds_mode = dataset.mode(numeric_only = True)   


### sum for all numerical columns ### 

ds_sum = dataset.sum(numeric_only = True)


### count for all columns ###

ds_count = dataset.count(axis='columns')


### Subset your DataFrame based on one condition ###

# When I have only one condition, I Used: np.where 
import pandas as pd
import numpy as np

DS = pd.DataFrame({'Type':list('ABBC'), 'Set':list('ZZXY')})
DS['University_Name'] = np.where(DS['Set']=='Z', 'Harv', 'sh')
print(DS)

# When I have Tow condition, I Used: np.select

# If have more than Used : 
def set_University_Name(row):
    if row["Set"] == "Z":
        return "Harv"
    elif row["Type"] == "C":
        return "sh"
    else:
        return "cal"

DS = df.assign(color=df.apply(set_color, axis=1))
print(DS)
