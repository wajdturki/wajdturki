#import pandas as pd

# load University dataset UCI, Downloded to myDesk from this link: https://archive.ics.uci.edu/ml/datasets/University
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


#---------------------------the same way to loading 2 dataset .csv

#--------------------------------------------------

import pandas as pd

# load balloons dataset UCI, Downloded to myDesk from this link: https://archive.ics.uci.edu/ml/datasets/Balloons
#Attribute Information:
#(Classes Inflated T or F) 
#Color: yellow, purple 
#size: large, small 
#act: stretch, dip 
#age: adult, child 
#inflated: T, F

PATH = ("./data/balloons.csv")
df = pd.read_csv(PATH)
df.columns = ['Color', 'size',  'act',
                   'age', 'inflated']

color= ("yellow", "purple")
size= ("large", "small") 
act= ("stretch", "dip")
age= ("adult", "child")

#use del df to delete a column:

print("The DataFrame object before deleting the column")
print(df)
del df['size'] #Deleting Size colum then print it
print("The DataFrame object after deleting the column a")
print(df)


#-------------------------------------------------------------------------------------


import pandas as pd

# loading Basketball dataset UCI, Downloded to myDesk from this link: https://archive.ics.uci.edu/ml/datasets/Basketball+dataset

PATH = ("./data/proyecto.csv")
df = pd.read_csv(PATH)

#Abstract: It's data collected from different volunteers that are done in a basketball practice: dribbling, pass, shoot, picking the ball, and holding the ball.
