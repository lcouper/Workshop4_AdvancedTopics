### R workshop 4 practice exercise solutions

# 1.1)
Rich = c(5,8,7,13,11,10,11,7,10,7,8,5,6,9,9,8,11,8,9,5,6,8,6)

# 1.1a)
length(Rich) # There are 23 entries

# 1.1b)
LogRich = rep(0,23)

#1.1c)
for (i in 1:length(Rich))  # Could have also written this as for (i in 1:23)
{LogRich[i] = log(Rich[i])}
# Output values are all ~ 1-2, so looks like it worked correctly

# 1.2)
Diversity = c(0.14, 0.92, 0.78, 1.44, 0.824, 0.876, 0.52, 0.72, 1.09, 0.75,
              0.64, 0.78, 0.81, 0.60, 0.57, 0.34, 0.29, 0.694, 1.194, 0.561,
              0.11, 0.65, 0.422)

# 1.2.1)
Evenness = vector(mode = "numeric", length = 23)
# Note this is a different way to create an empty vector
# We could have also done:
Evenness = rep(0,23) # as before

# 1.2.2) 
for (i in 1:23)
{Evenness[i] = Diversity[i]/ LogRich[i]}

# 1.3)
SpEven = function(x,y)
{Output = y/ log(x)
print(Output)}

# 1.4.1)
DivCategory = vector(mode = "character", length = 23)


# 1.4.2)
for (i in 1:23)
{
  if (Diversity[i] < 0.50)
  {DivCategory[i] = "Low"}
  if (Diversity[i]> 0.50 & Diversity[i]<1.0)
  {DivCategory[i] = "Medium"}
  if (Diversity[i] > 1.0)
  {DivCategory[i] = "High"}
}


# 1.5)
Size = c(19, 259, 97, 150, 118, 59, 28, 331, 210, 170, 441, 48, 256,21,
         378, 182, 140, 146, 74, 73, 59, 222, 239)
# Using original Diversity values
plot(Diversity ~ Size) # Create scatterplot
fit1 = lm(Diversity ~ Size) # Run a single linear regression
abline(fit1) # Add regression line to scatterplot
summary(fit1) # Look at output of linear regression
# No significant relationship between size and diversity 

# 1.6)
Size2 = rep(0,23)
for (i in 1:23)
{Size2[i] = Size[i] * 10000}

# 1.7)
SizeConvert = function(x)
{y = x*10000
print(y)}
SizeConvert(Size)
# Output is the same as that of the for loop

# 1.8)
# They are both essentially ways of scaling up a calculation or function call many times 

# 2)
Mosqs = read.csv("~/Downloads/Anopheles_Data.csv", header = TRUE)

# 2.1)
# We wanted to loop over all possible rows. 
# The if statement within the for loop allowed us to subset from these rows, 
# only the ones where the sample location was 'Thousand Oaks'

# 2.2) 
# We didn't create an empty vector here because we wanted to overwrite the original dataset
# rather than create a new vector/data set with data

# 2.3)

for (i in 1:2270)
  if(Mosqs[i,3] == "French")
  { Mosqs[i,2] = Mosqs[i,2] + 3}

# 2.4.1)
# The input is now a data frame. You can check this by running:
class(Mosqs)

# 2.4.2)
QuickPlots(Mosqs) # Should get a plot of mosquito abundances over time, shown in blue, filled dots

# 2.4.3)
QuickHits = function(a1)
 { print(c(mean(a1[,2]), sd(a1[,2]), range(a1[,2])))}

# 2.4.4)
QuickHits(Mosqs) # outputs the mean, sd, and range of mosquito values


#3)
Exams = read.csv("~/Downloads/ExamScores.csv", header = TRUE)


#3.1)
dim(Exams) # See how many students there are in the dataset
ExamAvgs = rep(0,14)

for (i in 1:14)
{ExamAvgs[i] = mean(c(Exams[i,1], Exams[i,5], Exams[i,9]))}

# 3.2)
LowQuiz = function(x)
{print(min(x[c(2,3,4,6,7,8)]))}

# 3.3)
LowQuiz(as.numeric(Exams[1,]))

# 3.4)

LowestQuizScore = rep(0,14)
for (i in 1:14)
{LowestQuizScore[i] = LowQuiz(Exams[i,])}

# 3.5)
FinalGrade = function(x)
{Grade = mean(x[c(1,5,9)])*0.70 + mean(x[c(2,3,4,6,7,8)])*0.30
  print(Grade)}

# 3.6)
FinalGrade(as.numeric(Exams[1,]))

# 3.7)
StudentFinalGrades = rep(0,14)
for (i in 1:14)
{StudentFinalGrades[i] = FinalGrade(as.numeric(Exams[i,]))}

StudentFinalGrades

# 3.8)
Exams = cbind(Exams, StudentFinalGrades)

# 3.9)
fit = lm(Exams$StudentFinalGrades ~ Exams$Exam1)
plot(Exams$StudentFinalGrades ~ Exams$Exam1)
abline(fit)
# R^2 ~ 0.54. Exam 1 scores to appear to be a significant predictor of final exam grades
# (which I suppose is obvious since exam 1 grades are a component of the final score)


# 4.1)
# To change the range of the output, you would adjust the while (b<50) statement
# If you wanted more numbers, you could change this to: while (b<100), for example

# 4.2)
# The loop ends at 34 because that is the last value in the sequence before b<50
# I.e. the next value is 55 (21+34).
# Notice that this while loop does not iterate by one's like the for loop,
# but iterates based on the value of b which is changing by a different amount each time
# This is the main reason why you'd want to use a while loop rather than a for loop
# to create this type of sequence

# 4.3)
# 'a' is a placeholder for the previous number in the sequence
# 'b' is a placeholder for the current number in the sequence

#5.1) 
# First create this pool of numbers:
Lottery = c(1:100)

# Now create a while loop to draw numbers from this pool until the number '100' is drawn
Draw = sample(Lottery, 1) # Initialize the loop with a starting value

while (Draw != 100) # Specify that you want the loop to run until the value for Draw = 100
  {print(Draw)  # Print the output
  Draw = sample(Lottery,1)}  # Sample from the pool of numbers



for (i in 1:100)

Draw = sample(Lottery, 1) # Initialize the loop with a starting value
while (Draw != 100) # Specify that you want the loop to run until the value for Draw = 100
{print(Draw)  # Print the output
  Draw = sample(Lottery,1)} 
