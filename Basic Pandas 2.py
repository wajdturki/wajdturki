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

# Assignment :-
# Look at your DataFrame shape:

dataset = pd.DataFrame({'col1': ["saud", "imam"], 'col2': [1, 2]})
dataset.shape

# head :

dataset.head()
dataset.head(1)

# tail :

dataset.tail()

