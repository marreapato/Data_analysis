# =============================================
# Introduction to R
# =============================================
# Paulo Canas Rodrigues (paulocanas@gmail.com)
# CAST, University of Tampere, Finland
# 26/04/2018 and 08/05/2018
# =============================================


# --------------------------------------------
# --------------------------------------------
# 0. Generalities
# --------------------------------------------
# --------------------------------------------
getwd()                 # gives the current working directory (wd)
dir()                   # lists all files in the current working directory
setwd("E:\\Desktop")    # sets a new working directory

x<- 5                   # atributes the value 5 to the object 5
x                       # gived the value of x
ls()                    # lists the names of all objects in the workspace
rm(x)                   # removed x from the workspace
ls()
x                       # x was removed and does not exist anymore
rm(list=ls())           # removes all objects from the workspace

install.packages("lattice")  # install the package lattice
library(lattice)             # loads the package lattice
?lattice                     # or help(lattice): gived the help of a package or a function



# --------------------------------------------
# --------------------------------------------
# 1. Using R as a calculator
# --------------------------------------------
# --------------------------------------------
2+3
12*(10+1)
3.5E03 + 4E-01
sin(pi/2)        # pi is a built-in constant
abs(-10)         # absolute value
1001/0
sqrt(225)        # square root
15^2             # power
exp(2)           # exponential
log(2)           # logarithm
round(pi,2)      # rounds pi with two decimal places
floor(pi)        # rounds down to nearest integer
ceiling(pi)      # rounds up to nearest integer



# --------------------------------------------
# --------------------------------------------
# 2. Basic data types and operations
# --------------------------------------------
# --------------------------------------------
rm(list=ls())

# ........
# Numbers
# ........
x<- 7	                # integer
y<- 0.8	              # numeric (real number)
z<- 3+0i            	# complex
class(z)              # gives the class of z

Inf		                # infinity
1/Inf
Inf/1
NaN       	          # not a number
NA	                	# not available/missing value

is.na(x)	            # tests whether x is available or not
is.nan(x)             # tests whether x is a number or not

a<- 5
a
b<- sqrt(a*a+3)
b
ls()


# ........
# Strings
# ........
a <- "hello"          # we can have objects that are strings
a
class(a)              # or typeof(a): gives the class of the object a
print("Hello R!")     # prints thw text in the argument of the function


# ........
# Factors
# ........
# When we have different levels of some explanatory variable (e.g. male/female)
data = c(1,2,2,1,1,2,1,2,1,2,2,1,1)              # creates a vector
fdata = factor(data, labels=c("Male","Female"))  # transforms the vector in a factor
fdata
levels(fdata)                                    # lists the levels of the factor
class(fdata)                                     # gives the class of the object fdata
summary(fdata)                                   # gives the summary of fdata


# ...............
# Logical objects
# ...............
x<- TRUE
x
y <- F
y
!y                        # "not x"
x == y                    # tests whether x and y have the same logical value
x != y                    # tests whether x and y have a different logical value
x & y                     # gives the logical value of x or y
x | y                     # gives the logical value of x and y

a<- 1; b<- 2
a < b
a <= b
a > b
a >= b



# --------------------------------------------
# Vectors
# --------------------------------------------
x <- c(1, 2.3, 2, 1.1, 4)   # creates a numerical vector
length(x)                   # gives the length of x
x[3]                        # returns the 3rd value of x
x[c(2,4)]                   # returns the 2nd and 4th values of x
x[1:3]                      # returns the first three values of x
x[x < 2]                    # returns all values from x that are < 2
x[-c(1,3)]                  # returns x without the values in the 1st and 3rd positions
y<- 2*x+1                   # simple operations with a vector
y

colors <- c("green", "blue", "red")  # the vector can also be made of characters
colors[1]                            # returns the 1st position of the vector

x <- c(TRUE, FALSE, FALSE, TRUE)     # or c(T,F,F,T): a logical vector
x
is.logical(x)                        # checks whether x is logical
is.character(x)                      # checks whether x is character

seq1<- 3:8                # sequences
seq1
seq2<- - 2:1
seq2
seq3<- seq(4)             # check the help of the function: ?seq
seq3
seq4<- seq(1,3,0.5)       
seq4
seq5<- seq(from =-1, to =7, by =2)
seq5

rep1<- rep(20, 6)
rep1
rep2<- rep (seq(4), 2)
rep2

v <- vector()                         # creates an empty vector
v
v1 <- vector("numeric", length = 20)  # create an empty vector with 20 positions
v1


# split numeric data into groups
age <- sample(0:65, 10, replace=TRUE)
age
#
age.group <- cut(age, c(0,12,18,65,100), labels = c("child", "teen", "adult", "senior"))
age.group
age.group[2]
#
ages <- cut(age, 3, labels=c("small","medium","large"))  
ages
table(ages)


# Example about factors
# Assume the hights of 4 men and 3 women as follows
hights<- c(175, 184, 180, 182, 176, 174, 169)
hights
# Define the gender
gender<- as.factor(rep(0:1, c(4,3)))
gender
# Name the levels
levels(gender) <- c("Men", "Women")
gender
# Count the number of men and women
table(gender)
# Compute the mean of all indivuduals
mean(hights)
# Compute the mean hight per gender
by(hights, gender, mean)



# --------------------------------------------
# Matrices
# --------------------------------------------
x<- matrix(seq(12), ncol=3)            # defines a matrix
x
y<- matrix(seq(12), ncol=3, byrow=T)   # this is different!
y

x[1,2]                                 # the value in the 1st row and 2nd column
x[3,]                                  # the 3rd row
x[,1]                                  # the 1st column
x[1:3,c(1,3)]                          # the first three rows in the 1st and 3rd columns

dim(x)                                 # returns the simention of the matrix
cbind(c(1,2,3), c(4:6))                # combine by column
rbind(c(1,4), c(2,5), c(3,6))          # combine by row

x1<- matrix(1:6, ncol=2)               # a (3x2) matrix
x2<- matrix(6:1, ncol=3)               # a (2x3) matrix
x1 %*% x2                              # product of matrices
t(x1)                                  # the transpose of x1
t(x1)*x2                               # elementwise product of matrices
x1
rbind(x1, c(99,99))                    # add a row to x1

mat1 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)
mat2 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3, byrow=TRUE)
rowSums(mat1)            # sum per row
colSums(mat1)            # sum per column
rowMeans(mat1)           # means per row
colMeans(mat1)           # means per column
sum(mat1)                # sum of all elements
mean(mat1)               # mean of all elements
sd(mat1)                 # standard deviation of all elements
mat1+mat2                # sum of matrices
rbind(mat1, mat2)        # Combine two matrices by rows (vertically)
cbind(mat1, mat2)        # Combine two matrices by columns (horizontally)




# --------------------------------------------
# Arrays
# --------------------------------------------
ar1 <- array(1:24, dim=c(3,4,2)) # an array generalizes a matrix for more than 2 dimentions

# Check out the output of the following commands
ar1[,2:3,]
ar1[2,,1]
sum(ar1[,,1])
sum(ar1[1:2,,1])




# --------------------------------------------
# Lists
# --------------------------------------------
x<- list("fly", 43, hi = "hello", TRUE, fun=1:3)
x
x[2]
x[5]
x$fun
x$hi

person<- list(age=21, name="Fred", score=c(65,78,55))
person
person$name
person[[2]]
person[[3]]
person$score[2]
person[[3]][2]




# --------------------------------------------
# Data Frames
# --------------------------------------------
# Example 1
x1 <-1 : 10
x2 <-11 : 20
x3 <-letters[1 : 10]
d1 <-data.frame(x1, x2, x3)
d1
attributes(d1)

# Example 2
d2<- data.frame(X=1:10, Y=c(51, 54, 61, 67, 68, 75, 77, 75, 80, 82))
d2
names(d2)
d2$X
d2$Y
plot(d2)
plot(d2$X, d2$Y)

# Example 3
d3<- data.frame(Y=c(10+rnorm(5, sd=2), 16+rnorm(5, sd=2), 14+rnorm(5, sd=2)))
d3$lev <- gl(3,5)    # gl(n,k) - generates a factor for n levels with k repetitions
by(d3$Y, d3$lev, summary)

# Example with data from R
?iris
iris
head(iris)      # first 6 rows
tail(iris)      # last six rows
names(iris)     # name of the columns/variables
row.names(iris) # name of the rowns/individuals

summary(iris)   # summary of the data

plot(iris)      # generic plot function dependent on the type/class of data
nrow(iris)      # number of rowns in the data
ncol(iris)      # number of columns in the data
dim(iris)       # dimention of the data
dimnames(iris)  # names for the rows and columns of the data

# Check these examples
table(iris$Species)
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
head(iris[,1])
head(subset(iris, select= -Species))

slen<- iris[,1]       # 1st column of the data
is.vector(slen)       # check whether it is a vector
species<- iris[,5]    # 5th column of the data
median(slen)          # median
hist(slen)            # histogram
pairs(iris)           # scatterplot matrix 

?boxplot              # boxplot
boxplot(slen ~ species, main="Sepal Length variation per Species")

miris <- data.matrix(iris)    # convert a dataframe to matrix
is.matrix(miris)
head(miris)	    # note conversion of species to integer (only one element type in a matrix)
miris[1,]       # 1st row (case/sample)
miris[1,5]      # one cell only
nrow(miris)
ncol(miris)
dim(miris)

attach(iris)
par(mar=c(3,4,4,1), mfrow=c(4,1),xlim=c(0,8))
#par(mar=c(3,4,4,1), mfrow=c(2,2),xlim=c(0,8))
hist(Sepal.Length, main="Sepal Length", ylab="Freq")
hist(Sepal.Width)
hist(Petal.Length)
hist(Petal.Width)
detach(iris)

tmp <- as.data.frame(miris)   # convert a matrix to dataframe
is.matrix(tmp)
is.data.frame(tmp)
head(tmp)                     # the Species continued as integer







# --------------------------------------------
# --------------------------------------------
# 3. Import and export data
# --------------------------------------------
# --------------------------------------------
data()  # list of datasets currently available in R
CO2
help(CO2)


# --------------------------------------------
# Read from a file
# --------------------------------------------
setwd("E:\\Desktop\\Trabalhos 2018\\1.3. Introduction to R - UTA")

Santa <-read.table("IsThereASantaClaus.txt", sep="\t", header=TRUE)
Santa

class(Santa$Gender)
Santa$Gender <- factor(Santa$Gender)
Santa$Bahaviour <- factor(Santa$Behaviour)

# OR
Santa2 <-read.table("IsThereASantaClaus.txt", header=TRUE, sep="\t",
                    colClasses=c("logical", "integer", "factor", "integer", "factor"))
Santa2

# OR
Santa3<- read.csv("IsThereASantaClaus.csv", header =TRUE, sep=",",
                  colClasses=c("logical", "integer", "factor", "integer", "factor"))
Santa3



# --------------------------------------------
# Export tabular data as an ascii file
# --------------------------------------------
setwd("E:\\Desktop\\Trabalhos 2018\\1.3. Introduction to R - UTA")
write.table(iris, "test.txt")   
getwd()            # the file is written here...

# if very large data, more effective  (the used format also differs from the write.table)
library(MASS)
write.matrix(iris, "test2.txt")

# write to a csv file
write.csv(iris, "test3.csv")









# --------------------------------------------
# --------------------------------------------
# 4. Basic Probability Distributions
# --------------------------------------------
# --------------------------------------------
help(Distributions)  # list of distributions in the stats package
# "d"	returns the height of the probability density function
# "p"	returns the cumulative density function
# "q"	returns the inverse cumulative density function (quantiles)
# "r"	returns randomly generated numbers

# --------------------------------------------
# The Normal Distribution
# --------------------------------------------
help(Normal)

# dnorm: given a set of values it returns the height of the 
#        probability distribution at each point
dnorm(0)
dnorm(0)*sqrt(2*pi)
dnorm(0,mean=4)
dnorm(0,mean=4,sd=10)
v <- c(0,1,2)
dnorm(v)
x <- seq(-20,20,by=.1)
y <- dnorm(x)
plot(x,y)
y <- dnorm(x,mean=2.5,sd=0.1)
plot(x,y)

# pnorm: Given a number or a list it computes the probability that a
#        normally distributed random number will be less than that number
pnorm(0)
pnorm(1)
pnorm(0,mean=2)
pnorm(0,mean=2,sd=3)
v <- c(0,1,2)
pnorm(v)
x <- seq(-20,20,by=.1)
y <- pnorm(x)
plot(x,y)
y <- pnorm(x,mean=3,sd=4)
plot(x,y)

# qnorm: you give it a probability, and it returns the number whose 
#        cumulative distribution matches the probability
qnorm(0.5)
qnorm(0.5,mean=1)
qnorm(0.5,mean=1,sd=2)
qnorm(0.5,mean=2,sd=2)
qnorm(0.5,mean=2,sd=4)
qnorm(0.25,mean=2,sd=2)
qnorm(0.333)
qnorm(0.333,sd=3)
qnorm(0.75,mean=5,sd=2)
v = c(0.1,0.3,0.75)
qnorm(v)
x <- seq(0,1,by=.05)
y <- qnorm(x)
plot(x,y)
y <- qnorm(x,mean=3,sd=2)
plot(x,y)
y <- qnorm(x,mean=3,sd=0.1)
plot(x,y)

# rnorm: generates random numbers whose distribution is normal
rnorm(4)
rnorm(4,mean=3)
rnorm(4,mean=3,sd=3)
rnorm(4,mean=3,sd=3)
y <- rnorm(200)
hist(y)
y <- rnorm(200,mean=-2)
hist(y)
y <- rnorm(200,mean=-2,sd=4)
hist(y)
qqnorm(y)
qqline(y)



# --------------------------------------------
# The t Distribution
# --------------------------------------------
help(TDist)

# rt: generates random numbers whose distribution is t
rt(3,df=10)
rt(3,df=20)
rt(3,df=20)




# --------------------------------------------
# The Binomial Distribution
# --------------------------------------------
help(Binomial)

# rbinom: generates random numbers whose distribution is binomial
rbinom(5,100,.2)
rbinom(5,100,.7)



