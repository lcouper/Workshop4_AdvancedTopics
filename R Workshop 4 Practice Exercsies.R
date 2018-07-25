### R Workshop 4 Practice Exercises ####

# 1.1 
# You have the following values for the species richness of small mammals (# of different species)
# for a given site in CA:
Rich = c(5,8,7,13,11,10,11,7,10,7,8,5,6,9,9,8,11,8,9,5,6,8,6)

# 1.1.a) How many entries are in 'Rich'? (i.e. How long is the vector)

# 1.1b) Create a new empty vector, called LogRich, of this same length

# 1.1c) Use a for-loop to calculate the log (base 10) of these richness values 
# and store these in LogRich. Exmaine the output to make sure you did this correctly

# 1.2
# You also have the following values for species diversity (Shannon's diversity) 
# at the same sites:
Diversity = c(0.14, 0.92, 0.78, 1.44, 0.824, 0.876, 0.52, 0.72, 1.09, 0.75,
              0.64, 0.78, 0.81, 0.60, 0.57, 0.34, 0.29, 0.694, 1.194, 0.561,
              0.11, 0.65, 0.422)

# Species evenness is a measure of the relative abundances of different
# species in a community. It is calculated as the Species Diversity / log(Species Richness)

# 1.2.1)
# Create an empty vector called Evenness, of length 23

# 1.2.2) 
# Now create a for loop to calculate the species evenness for each of the 23 sites
# And store these in the Evenness vector

# 1.3
# Rather than using the evenness equation within the for-loop approach 
# to calculate evenness - create a function that calculates species
# evenness based on species richness and diversity
# (i.e. 2 inputs- first is richness, second is diversity. 1 output)
# Call the function "SpEven"

# Use this function to calculate the species evenness on the same vectors
# as above and commpare your answers between the 2 approaches


# 1.4
# You now want to group sites based on their diversity values
# into "Low", "Medium", and "High" groups
# 'Low' diversity sites are those with Diversity values between 0.11 and 0.50
# 'Med' sites are those with values between 0.51 - 1.0
# 'High' sites are those with values above 1.0

# 1.4.1)
# Create an empty vector of class 'character' to store these groupings (you may need to google how to do this)
# Call the vector "DivCategory". It should be able to hold 23 entries

# 1.4.2)
# Create a for-loop that assigns a category (low, medium, high)
# to a site based on the observed Diversity values
# Do so by completing the outline of the for-loop with if/else statements below:

for (i in 1:23)
  {
  if (Diversity[i] < 0.50)
  {DivCategory[i] = "Low"}
  if (Diversity[i]> 0.50 & Diversity[i]<1.0)
  {# FILL IN CODE HERE}
  if (# FILL IN CODE HERE)
  {DivCategory[i] = "High"}
}

  
# 1.5)
# You also have the following values for the size (in hectares) of each site
Size = c(19, 259, 97, 150, 118, 59, 28, 331, 210, 170, 441, 48, 256,21,
         378, 182, 140, 146, 74, 73, 59, 222, 239)

# To practice R stats concepts from before --
# Is there a relationship between the size of the plot and the species diversity
# at the site?
# Evaluate this using the original diversity values
# You can do this by creating a scatterplot and conducting a linear regression

# 1.6)
# You want to compare the size of your plots to that of a different dataset
# which measured plot size in square meters
# Create a for loop to convert the size values from step 1.5 to units of m^2,
# and store these values in a new vector called Size2
# Note that 1 hectare = 10,000 square meters

# 1.7) Create a function called "SizeConvert"
# That takes as input a value in hectares and provides as output, 
# the size value in square meters (1 hectare = 10,000 square meters)
# Use your newly created function on the Size vector 
# and compare your answer to that obtained from the for loop approach 

# 1.8) You are probably starting to see that the same task can often be achieved
# by either using a for loop or a function. What is the commonality in these two approaches?
# i.e. what is the basic common goal of both the for loop and function?


# 2
# Pull up the Anopheles data set from workshop 1 and refamiliarize yourself with this dataset
# The team that collected mosquitoes at the "Thousand Oaks" site made an error in species identification
# To correct for this, you need to divide all mosquito values from this site by 2
# Use the code below to do this & overwrite the original dataset with the new values:

for (i in 1:2270)
if(Mosqs[i, 3] == "Thousand Oaks")
{Mosqs[i,2] = Mosqs[i,2]/2}

# 2.1) Why did the for loop run from 1:2270?
# 2.2) How come we did not create an empty vector to store values in?

# 2.3) 
# Similar to the above example, lets say all the mosquitoes collected at the site "French"
# were underestimated. We want to add 3 to the value column for all rows with
# counts taken at the French data set.
# Modify the code in question 2 to create a for loop that can do this

# 2.4) CHALLENGE
# At the mosquito control district, you will get lots of datasets that look similar to this one
# You want to create a function that can quickly take in a dataset and
# create a plot of mosquito abundance by month
# Call the function "QuickPlots":

QuickPlots = function(a1)
{plot(a1[,6],a1[,2], main = "Mosquito Abundance by Time", col = "blue", pch = 16,
      xlab = "Month", ylab = "Mosquito Abundance")}

# 2.4.1)
# What is the format of the input to the function QuickPlots? (i.e. is it a vector? data point?)

# 2.4.2)
# Try running the QuickHits function on the Mosq dataset. Did you get the expected output?

# 2.4.3)
# Using a similar approach as above, create a function that will take the same input
# as the QuickPlots function (i.e. a dataframe formatted the same way as Mosqs)
# and print out basic summary stats including the mean, standard deviation 
# and range for mosquito abundance values. Name the function whatever you like

# 2.4.4)
# Run your function on the Mosqs dataset to make sure it works

# 3)
# Import and View the "ExamScores" csv file uploaded on github
# This dataset contains various quiz and exam scores for a class
# Make sure when importing that you specify that there are column names in this dataset

# 3.1)
# For each student, you want to calculate the average score on the Exams only.
# Create a for loop that can perform this calculation for you, for every student
# Store the output in a new vector, named whatever you like

# 3.2)
# Create a function that identifies the lowest QUIZ score for a single student
# The input to this function should be a vector of quiz and exam grades, 
# and the output should be the lowest QUIZ grade 
# Note this is slightly different from the "min" function because it ignores the exam grades
# Call this function "LowQuiz"

# 3.3)
# Now use this function on the first row of the dataset to make sure that it works

# 3.4)
# Now use this funciton within a for loop to calculate the lowest quiz score
# for each student. Store the output in a vector called "LowestQuizScore"

# 3.5)
# Create a new function that calculates a final numeric grade for each student
# which combines all the quiz scores as 30% of the grade and the exam scores as 70% of the grade
# The function should again take as an input, a vector of grades for a single student,
# and output a single numeric grade

# 3.6)
# Run this function on the first student to calculate their final exam grade

# 3.7)
# Again, use a for-loop to use this function on all students. Store the output 
# in a vector called "StudentFinalGrades"

# 3.8)
# Use the cbind function to add this new vector onto the end of the Exams dataframe

# 3.9)
# Practicing some stats concepts from last time - how well does the student's exam1 grade
# predict the student's final grade? (i.e. run a linear regression)
# You can also create a scatterplot and add the regression line 

# 4) While loop walk through
# While loops work by running the loop until some condition is met
# This is unlike for loops which run for a pre-specified range

# Here we'll use a while loop to print out the first Fibonacci numbers: 0,1,1,2,3,5,8,13...
# where each number in the sequence is the sum of the 2 previous numbers

# The code below demonstrates how to do this using a while loop:
a <- 0
b <- 1
while (b < 50) {
  print(b)
  temp <- a + b
  a <- b
  b <- temp
}

# 4.1 How would you update the code above to produce more numbers in the sequence?
# 4.2 Why does the loop here end at the number 34? Why not 49?
# 4.3 What are 'a' and 'b' placeholders for in this example?

# 5.1) While loop practice (HARD)
# You are playing a lottery style game where you randomly select numbers (with replacement)
# from the pool of integers 1:100
# The person to draw the number '100' first, i.e. in the fewest number of draws, wins
# Simulate this game using a while loop
# Then try playing it for yourself and see how many draws it takes you to get to 100
# Hint: you'll want to create the pool of potential numbers first
# i.e. the vector of integers ranging from 1:100
# Then use the sample function, within a while loop, to draw from it



