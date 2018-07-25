#### R Workshop 4 Notes ####
# Topics: For loops, if/else statements & functions 

#### For loops ####

# Use: To repeat some type of function/command many times (“Loop over your code”)
# Similar to the "apply" function family but more powerful

# Example 1:
# Convert the list of temps from celsius to farenheit and store in new vector
temps = c(31.0, 29.1, 28.5, 32.3, 32.7, 29.4) 

# For just one case:
farenheit = temps[1]*9/5 + 32

farenheit = rep(0,6)  # create an empty vector for new data to live
# There are lots of way to initialize an empty vector. You could have also done:
# farenheit = vector() 

for (i in 1:6)  # Define the range over which you want to iterate
{farenheit[i] = temps[i] * 9/5 + 32}  # Define what function you want performed

farenheit # Look at farenheit

# General steps:
# 1) Write out code for a single case
# 2) Create any empty vector for new values to live
# 3) Set # of times for the loop to run
# 4) Provide code to be repeated from step 1, but update for a general case


### If/Else Statements ###

# Logic statemetns telling R whether or not to run code based on whether some other condition is met
# Example:

x = 5
if (x <10){print(x)} 
# Since x <10, R prints out the value of x

x = 5
if (x >10){print(x)
} else {print(10)}
# Since x is not > 10, R goes to the "else" part and prints out the number 10


#Combining For loops and if/else statements
# Subtract 0.2 from all times measured at course 2

Course = c("Course1", "Course1", "Course2","Course1","Course2",
           "Course1","Course2","Course1", "Course1","Course2")
Times = c(12.4, 12.2, 12.7, 11.9, 13.4, 12.9, 13.1, 11.6, 12.1, 13.0)
DashTimes = as.data.frame(cbind(Course,Times))

# Times[3] = Times[3]- 0.2

for (i in 1:10)
  {if(Course[i] == "Course2")   
  {Times[i] = Times[i]-0.2}
  
  else{Times[i] = Times[i]}}  # Don't need this part - just showing as example
NewTimes = as.data.frame(cbind(Course,Times))

# If you had multiple courses with different corrections, can use
# multiple elseif statements

# There are also while loops which iterate until some condition is met --
# You will practice this in the exercises


### Functions ####

# many built-in functions like: mean, rbind, View, summary, etc. 
# But you can make your own functions! 

# Example: Make a function that converts from celsius to farenheit

# Similar to loops, start by writing the code for a small test case
farenheit = temps[1]*9/5 + 32

CtoF = function(x)
{farenheit = x*9/5 + 32
print(farenheit)}

# Then use the CtoF function similar to how you would use any other function
CtoF(temps)
# Or just use on a single value
CtoF(30.2)
# Or a list of values
CtoF(c(30.2, 19.2, 29.8, 40.6))

# Can also add in if/else statements, and make fun error messages
CtoF = function(x)
{if (x <= 100) {farenheit = x*9/5 + 32
print(farenheit)}
  else {print("Too hot!!!")}}

# Can create functions with mulitple inputs

# Example: BMI function
# Create a function to calculate body mass index given weight (in lbs) and height (in inches)
# x = weight input, y = height input
BMI = function(x,y)
 { x / (y^2) * 703}
  
# Use the function with first input being weight, second being height (in inches)
BMI(150, 60)

