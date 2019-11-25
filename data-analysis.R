# Data Analysis process
a <- 0
b <- 3
print(log(a))

args(log)

log(8, base = 2)
log(x = 8, base = 2)
2^3


# Creating Variable Names
AB <- 20
AC <- 200
AD <- 5

solution_1 <- (-AC + sqrt(AC^2 - 4*AB*AD)) / (2*AB)
solution_2 <- (-AC - sqrt(AC^2 - 4*AB*AD)) / (2*AB)

# Notation and Naming #
# file names - names should be meaningful and end in .R

# Good
#     -------   fit-models.R
#     -------   utility-functions.R

# Bad
#     ------ foo.r
#     ------ stuff.r

# Files need to be run in sequence, prefix them with numbers:
0-download.R
1-parse.R
2-explore.R

# Objective Names
  # " There are only two hard things in computer science: cache invalidation and naming things" - Phil Karlton
    # variable and function names should be lowercase. Use underscore(_) to separate words within a name. 
  # good
  day_one
  day_1
  #bad
  first_day_of_the_month
  DayOne
  dayone
  djm1
  # where possible, avoid using names of existing function and variabels
  # bad
  T <- FALSE
  c <- 10
  mean <- function(x) sum(x)
  
  # Syntax - spacing
  # Place spaces around all infix operators (=, +, -, <-, etc.).
  # The same rule applies when using = in function calls. Always put a space after a comma, and never before (just like in regular English).
  
  # good
  average <- mean(feet / 12 + inches, na.rm = True)
  
  # bad
  average<-mean(feet/12+inches,na.rm=True)
  
  # place a space before left parentheses, expect in a function call
  # good
  if (debug) do(x)
  plot(x, y)
  
  # bad
  if(debug)do(x)
  plot (x, y)
  
  # Extra spacing is okay if it improves alignment of equal signs or assignments (<-)
  list(
    total = a + b + c,
    mean = (a + b + c) / n
  )
  
  # do not place spaces around code in parentheses or sqaure brackets (unless there's a comma, in which case see above)
  
  # good
  if (debug) do(x)
  diamonds[5, ]
  
  # bad
  if ( debug ) do(x) # no spaces around debug
  x[1,] # need space after comma
  x[1 ,] # space goes after comma not before
  
  # Curly Braces
  # An opening curly brace should never go on its own line and should always be followed by a new line. A closing curly brace should always go on its own line, unless it’s followed by else.
  # Always indent the code inside curly braces.
    
  # Good
  
  if (y < 0 && debug) {
    message('Y is negative')
  }
  
  if (y == 0) {
    log(x)
  } else {
    y ^ x
  }
  
  
  # Bad
  
  if (y < 0 && debug)
    message('Y is negative')
  
  if (y == 0) {
    log(x)
  }
  else {
    y ^ x
  }
  
# its okay to leave very short statments on the same line:
  if (y < 0 && debug) message('y is negative')

# Line Length
  # strive to limit your code to 80 characters per line
  # indentation
    # never use tabs or mix tabs and spaces
  
  long_function_name <- function(a = "a long argument",
                                 b = "another argument",
                                 c = "another long argument"){
    # as usual code is indented by two spaces
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  