# =============================================
# Introduction to R
# =============================================
# Paulo Canas Rodrigues (paulocanas@gmail.com)
# CAST, University of Tampere, Finland
# 26/04/2018 and 08/05/2018
# =============================================


rm(list=ls())
setwd("E:/Desktop/Trabalhos 2018/1.3. Introduction to R - UTA") 
# --------------------------------------------
# --------------------------------------------
# 5. Basic statistics and plots
# --------------------------------------------
# --------------------------------------------
example(boxplot)
example(legend)

# let's use iris data as an example
dim(iris)
head(iris)
str(iris)

attach(iris)
summary(Sepal.Length)
summary(iris)
by(iris, Species, summary)   # get grouped summary information
with(iris, aggregate(Sepal.Length, list(SP=Species), median)) 
print(Sepal.Length)
(Sepal.Length)

mean(Sepal.Length)	
median(Sepal.Length)
max(Sepal.Length)
range(Sepal.Length)
diff(range(Sepal.Length))
quantile(Sepal.Length)
quantile(Sepal.Length[Species == "setosa"])
quantile(Sepal.Length[Species == "virginica"])

sd(Sepal.Length)		# standard deviation
var(Sepal.Length)		# variance
sd(Sepal.Length)^2	# variance
detach(iris)


# --------------------------------------------
# Basic Statistics
# --------------------------------------------
attach(iris)
table(Petal.Length)         # absolute frequencies of the values, cross-reference table
table(Species)			        # frequences for factors
table(Petal.Length, Species)
prop.table(Petal.Length)	  # relative frequency of each value
sum(prop.table(Petal.Length))

#  divide length into groups with equal range
lengths<- cut(Sepal.Length, 3, labels=c("small","medium","large"))    	
lengths
table(lengths, Species)			
table(lengths)	

# variance information from the data
by(iris, list(Species, lengths), summary)   # get grouped summary information
with(iris, aggregate(Sepal.Width, list(SP=Species, SL=lengths), median))

# correlation
cor(iris[,1:4])				# Pearson for normal distributions 
cor(Sepal.Length, Petal.Length)
plot(iris)
cor(iris[,1:4], method="spearman")  # for non-normal distributions  (like iris)
cor.test(Sepal.Length, Petal.Length, method="spearman")  # 0.88 high

# covariance
cov(iris[,1:4])

levels(Species)   # factor levels

par(mar=c(3,4,4,1), mfrow=c(1,2))  
new<- scale(Sepal.Length)		# standardized data
plot(new, ylim=c(-2,7.5), col="red")
abline(h=0)
plot(Sepal.Length, ylim=c(-2,7.5))
abline(h=0)
summary(new)
summary(Sepal.Length)


# Quantiles
quantile(Sepal.Length, 0.95, type=1)		# 95% percentile 
quantile(Sepal.Length, 0.50, type=1)		# 50% percentile 
quantile(Sepal.Length, c(0.05,0.95), type=1)	# 5% and 95% percentile


# CI - confidence interval

# CI for known standard deviation:  mean(x) +/- z * sd/sqrt(n)
# https://en.wikipedia.org/wiki/Confidence_interval

# 95% CI (two-tailed) for N distribution  
# before doing this make sure that the studied variable is normal at the same risk level as CI is estimated
# (here: Sepal.Width is only near to normal which bring a bit more bias to estimates)

n <- length(Sepal.Width)
avgx <- mean(Sepal.Width)
sdx <- sd(Sepal.Width)
# SE = sdx/sqrt(n); SE             # standard error estimate 

# for each significance level, the Z-test has a single critical value 
# (for example, 1.96 for 5% two tailed)
z <- 1.96  

round(c(avgx, sdx),2)	# mean: 3.06   sd: 0.44
round(c(avgx - z * sdx/sqrt(n), avgx + z * sdx/sqrt(n)),2)   #  CI: (2.99, 3.13)

lci <- avgx - z * sdx/sqrt(n)
uci <- avgx + z * sdx/sqrt(n)
c(lci, uci)

plot(density(Sepal.Width))
abline(v=avgx, col="green")
abline(v=lci, lty=3) 
abline(v=uci, lty=3)

# verify with t.test results (Sepal.Width is not quite N with 5% risk level):
t.test(Sepal.Width)
abline(v=2.987, lty=3, col="red") 
abline(v=3.128, lty=3, col="red")
# little bit wider area compared to z-based estimates

# ---------------

# for unknown population variance/sd the CI is calculated as follows:
# below example ref: 
# http://www.r-tutor.com/elementary-statistics/interval-estimation/interval-estimate-population-mean-unknown-variance

library(MASS)                  # load the MASS package 
height.response = na.omit(survey$Height) 

n = length(height.response) 
s = sd(height.response)        # sample standard deviation 
SE = s/sqrt(n); SE             # standard error estimate 

E = qt(.975, df=n-1)*SE; E     # margin of error 

xbar = mean(height.response)   # sample mean 
xbar + c(-E, E) 			 # CI

plot(density(height.response))
abline(v=xbar, col="green")
abline(v=xbar-E, lty=3) 
abline(v=xbar+E, lty=3)

# simply use for CI:
t.test(height.response) 


# ---------------------------------------------
#   BASIC PLOTS AND GRAPHICS
# ---------------------------------------------
# Use screen capture to export figures:
# -  Windows: Snipping Tool 
# -  MacOS:   Apple-character SHIFT 4
# or plot into a file:
help(Devices)

# plot into a file example --------------
png(file = "plot.png", bg = "transparent")
plot(iris)
dev.off()


par(mar=c(3,4,4,1), mfrow=c(3,2))   	# mar: bottom->left->top->right margins
plot(Sepal.Length, main="Sepal.Length")	# scatter plot
plot(Sepal.Length, main="Example Plot", type = "l")	# line plot
abline(h=6, col = "red", lty=3)
abline(v=50:100, col = "cyan", lty=3)
hist(Sepal.Length)
plot(Sepal.Width)
plot(Sepal.Width, xlim=c(50,100), ylim=c(2,3.7), main="Selection of an interesting area")


# how to play with more than one window at a time ---------------------

dev.new()			# create a new graphics window
# windows()			# creates a new graphics window (BUT only in windows)

plot(iris)			# pairwise scatter plots  (correlation)
pairs(iris)
dev.set(dev.prev())	# move into the first window  (set it as active window)
# or:
# dev.set(1)			# first device   
boxplot(Sepal.Length~Species,  col=c("pink","cyan", "lightgreen") )  
barplot(table(lengths, Species), horiz=TRUE, col=5:7, sub="small-medium-large", main="Sepal.Length frequencies per length group")
dev.set(dev.next())	# move into the second window
# dev.set(2)
# ---------------------------------------------------------------------


plot(Species, lengths)
title(main="Relative proportions", sub="Iris data")

plot(lengths, Species)
#plot(table(lengths, Species), main="")
tmp <- aggregate(Sepal.Length ~ Sepal.Width, data = iris, length)  # frequencies per each value of Sepal.Width
sum(Sepal.Width == 3.0)
plot(tmp, ylab="Frequency", main="Frequencies of Sepal.Width values")
hist(Sepal.Width, breaks = c(1.5, 3, 4.5))

par(mfrow=c(2,2)) 
plot(Species ~ iris[,1] + iris[,2] + iris[,3] + iris[,4])

# plotting probability distributions ------------------------------------------------------
par(mfrow=c(1,2))
# Describing the probability distribution (todennäköisyysjakauma) graphically  (comparisons)
hist(Sepal.Width, freq=FALSE, ylim=c(0,1.2), xlim=c(1.5,5), 	# or: prob=TRUE 
     main="Sepal.Width density with N-curve")   # the histogram has a total area of one (probability) 
curve(dnorm(x,mean(Sepal.Width),sd(Sepal.Width)), add=T)
plot(density(Sepal.Width, kernel="gaussian"), ylim=c(0,1.2), xlim=c(1.5,5), 
     main="Computed Sepal.Width density curve") # density computes (non-parametric) kernel density estimates (smooth)
hist(Sepal.Width, freq=F, add=T)			
# ----------------------------------------------------------------------------------------- 


# add additional information into a graphic window ----------------------------------------

# add points into the graph
for (i in 1:4) {
  points(y = 1 , x= 1 + i, pch=16, col= 1+i)    
}

seto <- subset(iris, Species == "setosa")
versi <- subset(iris, Species == "versicolor")
summary(seto); summary(versi)      # min & max values

plot(versi$Sepal.Length, versi$Petal.Length, type="n", xlim=c(4.3,7), ylim=c(1,6))   # suspended plot
text(versi$Sepal.Length, versi$Petal.Length, "V", col="blue")
points(seto$Sepal.Length, seto$Petal.Length, type="n")   # suspended plot with add
text(seto$Sepal.Length, seto$Petal.Length, "S", col="red")
# click with mouse for location:
legend(locator(1),legend=c("setosa","versicolor"), cex=0.7, lty=1, col=c("red", "blue"))  
# demo(plotmath)    # additional possibilites for mathematical data presentation

# adding some text into an existing window with mouse  (interactive plots)
plot(Sepal.Length ~ Petal.Length)
text(locator(3), "some text")    # click mouse and text is added to that point of window 3 times (in the end)
locator(4, "p")	# draw points 		
locator(4, "l")	# draw points with line	
locator(4, "n")	# get the mouse click points (x,y)
# identify(Sepal.Length, Petal.Length, tolerance=3)    # to catch the nearest point values

dotchart(Petal.Length)
stripchart(Petal.Length, add=TRUE, col="red")   # add=TRUE: add information into the active window
# -----------------------------------------------------------------------------------------

hist(Petal.Length)

pie(rep(1, 24), col = rainbow(24), radius = 0.9)

# for 3D  (draw z on 2D formed by x,y)
# image(x,y,z)
# contour(x,y,z)
# persp(z,y,z)


coplot(Sepal.Length ~ Petal.Length | Species)   # conditional plot based on Species
# matplot(Sepal.Length, Petal.Length)


# ADDITIONAL LIBRARIES   quick introduction to some selected features -------
# learn more according to needs

demo(lattice)
library(lattice)   # trellis graphics

xyplot(Petal.Length ~ Petal.Width | Species, data = iris, groups = as.character(lengths),
       pch=20, cex=1.1, col=(1:3), main="Species per Sepal.Length groups")
legend("topright",legend=c("large","medium","small"), cex=0.7, lty=1, col=(1:3))
legend(locator(1),legend=c("L","M","S"), cex=0.7, lty=1, col=(1:3))  # click with mouse for location

# plotting kerner density estimates
densityplot(~ Petal.Width, data=iris)
densityplot(~ Petal.Width | Species, data=iris)
densityplot(~ Petal.Width, group=Species, data=iris)

# plotting time series

Orange
xyplot(circumference ~age | Tree, data = Orange, type ="b")
xyplot(circumference ~age, group=Tree, data = Orange, type ="b")
xyplot(circumference ~age | Tree, data = Orange, type ="b", layout=c(5,1))

# SOME OTHER LIBRARIES 
#library(ggplot2)
#library(graphics)
demo(graphics)








# -----------------------------------------------------------------
# FITTING A LINEAR MODEL  - SIMPLIFIED EXAMPLE ONLY
# -----------------------------------------------------------------
# just to give an idea of how R code is created for (regression) modelling purposes
# an appropriate modelling process is ignored (out of scope of this course) - attend 
# separate methodology courses for detailed information

attach(iris)
par(mfrow=c(2,1))
f <- lm(Sepal.Length ~Sepal.Width)
plot(Sepal.Length ~Sepal.Width)
abline(f, lwd = 2, col="green")
abline(h=mean(Sepal.Length))
text(x= 4, y= mean(Sepal.Length) + 0.2, lty=2, paste("Average Sepal.Width: ", mean(Sepal.Width)), cex=0.7)
points(Sepal.Width[resid(f) < 0], Sepal.Length[resid(f) < 0], col="red")

plot(resid(f), main="Residuals of f")
abline(h=0)

#--------------

fit <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species)
BIC(fit); AIC(fit)
summary(fit)
plot(fit)
plot(residuals(fit), main="residuals") 


# I() function is used for defining interactions and defining operations in their original meaning

# a model with an interaction
fit2 <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species + I(Petal.Length*Petal.Width))
summary(fit2)
BIC(fit2);  AIC(fit2)    # Bayesian/Akaike Information Criteria for comparing different models

# a model with second degree polynomial term  - here I() squares variable Sepal.Width
fit3 <- lm(Sepal.Length ~ Sepal.Width + I(Sepal.Width^2) + Petal.Length + Petal.Width + Species)
BIC(fit3); AIC(fit3)	# smaller value indicate a better model
summary(fit3)

# Petal.Width dropped
fit3 <- lm(Sepal.Length ~ Sepal.Width + I(Sepal.Width^2) + Petal.Length + Species)
BIC(fit3); AIC(fit3)
summary(fit3)

# Sepal.Width dropped
fit3 <- lm(Sepal.Length ~ I(Sepal.Width^2) + Petal.Length + Species)
BIC(fit3); AIC(fit3)
summary(fit3)
plot(fit3)

# check normality of residuals 
# (e.g. for comparison of 2 models or checking the residuals for fit)

par(mar=c(3,4,4,1), mfrow=c(1,2))
plot(residuals(fit), main="residuals: fit")
abline(h=0, col="red")
plot(residuals(fit3), main="residuals: fit3")
abline(h=0, col="red")
# NOTE: resizing the graphics window may help the comparison


# predict how a new sample x0 (new data) fits into the model  
# (e.g. for comparison or checking/prediction purposes)

x0<- data.frame(Sepal.Length=5.3, Sepal.Width=3.1, Petal.Length=5.1, Petal.Width=1.3, Species="virginica")

(p <- predict(fit, new=x0, se=T, type="response")) 
# fit = 
# $se.fit =      # standard error of predicted means !!!

(p3 <- predict(fit3, new=x0, se=T, type="response"))
# fit = 
# $se.fit =      


# comparison of two models, F-test - NOTE! expects normality in the data  - otherwise results are nonreliable
anova(fit, fit3, test="F")	# , if F > 0.05, the H0 hypothesis (no variation difference in models) is dismissed and 
# H1 is accepted (the Model2 fits significantly better the data with 5% critical value)







# --------------------------------------------
# --------------------------------------------
# 6. Introduction to programming
# --------------------------------------------
# --------------------------------------------
# ---------------------
# if - else AND ifelse
# ---------------------
# condition testing

x <- 9

if ( x < 5) {
  x <- x + 1
} else if (x < 10) {
  x <- 10
} else {			# NOTE! all of these characters MUST be in the same line
  x <- 100
}

x

# testing NULL
# NULL value is used whenever there is a need to indicate or specify that an object is absent

tmp <- NULL
tmp

if (!is.null(tmp)) { 
  print(tmp)
} else {
  print("tmp is NULL")
}


# ifelse(condition, TRUE, FALSE)   

x <- c(1, 3, 5, 7, 10)

ifelse(x < 5, x, x^2)


# ---------------------
# for
# ---------------------
# loop

for (i in 1:5) {
  print(i)
}

x <- c("a", "b","c")

for (i in 1:length(x)) {
  print(x[i])
}


# or the same:

for (item in x) {
  print(item)
}


# or the same:

for (i in seq_along(x)) {
  print(x[i])
}


# nested for loops

x <- matrix(1:6, 2, 3)

for (i in 1:nrow(x)) {
  for (j in 1:ncol(x)) {
    print(x[i, j])
  }
}


# ---------------------
# while
# ---------------------
# loop

i <- 0

while (i < 5) {
  print(i)
  i <- i + 1
}


i <- 2
while (i > 1 && i < 12) {       #   !=, ||
  print(i)
  if (i <= 4) {
    i <- i + 1
  } else {
    i <- i + 2
  }
}

# infinite loop with optional stop condition


ok <- TRUE
while (ok) {
  # do something
  # until, you want to stop for some reason:
  ok <- FALSE
}


# ---------------------------------------------
# Functions
# ---------------------------------------------
# the last expression is returned 
# use list for returning versatile object types
# commenting the code is important!!!

# add function sums two numbers (x, y) and returns the result
add <- function(x,y) {
  x + y
} 

# use the above created function
x <- 2
y <- 3
(sum <- add(x,y))

# find out numbers in a vector (x) above given value (n)
x <- 1:20
y <- 8
test <- x > y
test
x[test]

# put the same functionality into a function (for repeatable use):

# above function tests if values of a given vector (vec) are above given limit (n) and returns 
# acceptable values in a vector, default for limit is 10
above <- function(vec, n=10) {
  test <- vec > n
  vec[test]
}

(above(x, y))
(above(x))


# change above to return only the count of acceptable numbers
above <- function(vec, n=10) {
  test <- vec > n
  length(vec[test])
}

(above(x, y))
(above(x))


# change above to return both acceptable values and count of them in a list
above <- function(vec, n=10) {
  test <- vec > n
  ok <- vec[test]
  
  list(ok, length(ok))   		 # return value of the function
  # return(list(ok, length(ok))) # return is not required to be visible
}

(above(x, y))
(above(x))

(above(x, y))[1]
(above(x))[2]


# calculates means of columns in a matrix
colmeans <- function(m, rmNA = TRUE) {  
  ncol <- ncol(m)   		# number of columns in m
  means <- numeric(ncol) 		# initialize vector for (means of columns)
  for (i in 1:ncol) {
    means[i] <- mean(m[,i], na.rm = rmNA)
  }
  means    # return the column means in a vector
  # invisible(means)   # return means but prohibit the print out of it
}

mat <- matrix(1:6, 2,3)
mat
colmeans(mat)   # if invisible(means): the result is not shown



# NOTE! special treatment of missing values (NA) in a matrix
mat <- matrix(1:6, 2,3)
mat[2,2] <- NA
mat
(colmeans(mat))
(colmeans(mat, FALSE))
(colmeans(m = mat, rmNA = FALSE))
(colmeans(rmNA = FALSE, m = mat))
# (colmeans(FALSE, mat))    # not acceptable!



