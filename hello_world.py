# 1. TASK: print "Hello World"
print( "Hello World" )
# 2. print "Hello wajd!" with the name in a variablecopy
name = "Wajd"
print("My name is " , name)	# with a comma
print("My name is " + name)	# with a +
# 3. print "Hello 46!" with the number in a variable
num = 46
print( “Hello {{46}}!” , num )	# with a comma
print( “Hello {{46}}!” + num )	# with a +	-- this one should give us an error!
# 4. print "I love to eat sushi and pizza." with the foods in variables
fave_food1 = "sushi"
fave_food2 = "pizza"
print( "My first favorite food is {} and My second favorite food is {}" .format(fave_food1,fave_food2 )) # with .format() 
print(f"My first favorite food is {fave_food1} and My second favorite food is {fave_food2} ") # with an f string
