installed.packages()
#print(a)
#ls()
(-b + sqrt(b^2 - 4*a*c))/(2*a)
#ls()

factorial <- function(a, b, c){
  pos_x <- (-1 * b + sqrt(b^2 - 4 * a * c)) / (2 * a)
  neg_x <- (-1 * b - sqrt(b^2 - 4 * a * c)) / (2 * a)
  c(pos_x, neg_x)
}





## Code to compute solution to quadratic equation of the form ax^2 + bx + c
## define the variables
a <- 3
b <- 2
c <- -1

## now compute the solution
(-b + sqrt(b^2 - 4*a*c)) / (2*a)
(-b - sqrt(b^2 - 4*a*c)) / (2*a)

# Advanced: Mathematically, the values in pop are integers and there is an integer class in R. However, by default, numbers are assigned class numeric even when they are round integers. For example, class(1) returns numeric. You can turn them into class integer with the as.integer() function or by adding an L like this: 1L. Note the class by typing: class(1L)
# Factors are useful for storing categorical data. We can see that there are only 4 regions by using the levels function:



# visualizing data
region <- murders$region
value <- murders$total
region <- reorder(region, value, FUN = sum)
levels(region)
# Warning: Factors can be a source of confusion since sometimes they behave like characters and sometimes they do not. As a result, confusing factors and characters are a common source of bug


