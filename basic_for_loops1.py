# 1 Basic
for i in range(1, 150):
    print(i)
   
# 2 Multiples of Five
for x in range(5, 1000, 5):
    print(x)
# output: 5,10,15,20,25,.....,1000

# 3 Counting, the Dojo Way 
for i in range(1,100): # Numbers between 1 and 100
    if i % 5 == 0:
# If i is divisible by 5 then print this:
        print("Coding")
  elif i % 10 == 0:
  print("Coding Dojo")
  
  # 4 Whoa. That Sucker's Huge 
  # Sum of Odd Numbers from 1 to 500000
 
Oddtotal = 0
for n in range(1, 500000+1):
    if(n % 2 != 0):
        print("{0}".format(n))
        Oddtotal = Oddtotal + n
print("The Sum of Odd Numbers from 1 to {0} = {1}".format(number, Oddtotal)) 
  
  # 5 Countdown by Fours 
 def countDown2(2018):
    for i in range(2018, 1, -2):
        print(i)
