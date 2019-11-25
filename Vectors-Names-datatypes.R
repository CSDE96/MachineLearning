data()
co2
library(dslabs)

data(murders)

# see that is in fact a data frame
class(murders)
str(murders)
head(murders)
murders$population

# names for each of hte five variables stored inthe table
names(murders)
# it is important to know that the order of the entries in murders$population
pop <- murders$population
lenght(pop)

class(pop)

class(murders$state)

# logical vectors
z <- 3 == 2
z
class(z)

# levels of regions by the total number of murders
region <- murders$region
value <- murders$total
region <- reorder(region, value, Fun = sum)
levels(region)





# Matrix ----------------------------------

mat <- matrix(1:12, 4, 3)
mat

# access specific entries using ([])
# selecting second row and third column
mat[2, 3]

# if you want the entire row
mat[2, ] # returns a vector not a matrix

# If you want entire third column
mat[, 3] # returns a vector not a matrix

# accessing more than one column or more than one row
mat[, 2:3]

# subset both rows and columns:
mat[1:2, 2:3]

# convert matrices into data frames
as.data.frame(mat)

# access rows and columns of a DATAFRAME
data("murders")
murders[25, 1]

# access 2nd and 3rd row of all columns
murders[2:3, ]

#Exercises 
library(dslabs)
data(murders)
head(murders)
str(murders)

data("murders")
b <- murders[, 2]
a <- murders$abb

a == b

# column storing a factor(s)
c <- class(murders$region)
unique(murders$region)
length(murders$region)
table(murders$region)

# Vectors ---------------------------------

# creating vectors
codes <- c(380, 124, 818)
codes

# create character vectors
country <- c("italy", "canada", "egypt")
# r can also use single quotes
country <- c('italy', 'canada', 'egypt')
# or
#country <- c(italy, canada, egypt)

# the object "codes" continues to be a numeric vector
class(codes)
# but with "names":
names(codes)
# if the use of strings without quotes looks confusing, you know that you can use the quotes as well
codes <- c("italy" = 380, "canada" = 124, "egypt" = 818)
codes


# using the names function
codes <- c(380, 124, 818)
country <- c("italy", "canada", "egypt")
names(codes) <- country
codes

# Sequences --------------------------------------------------------------------------------------------------

seq(1, 10)
# first argument defines the start and the second defines the end which is included. 
  # default is to go up increments of 1, but a third argument lets us tell how much jump by
    seq(1, 10, 2)
    # if we want consecutive integers (shorthand)
    1:10
    # R produces integers, not numerics (used for indexing)
    class(1:10)
    # however, if we create a sequence including non-integers, the class changes:
    class(seq(1, 10, 0.5))
    
# Subsetting -----------------------------------------------------------------------------------------------
    codes[2]
    # get more than one entry by using a multi-entry vector as an index:
    codes[c(1,3)]
    # Sequences defined above are particularly useful if we want to access, the first 2 elements
    codes[1:2]
    # if the elements are names
    codes["canada"]
    codes[c("egypt", "italy")]
    
# Coercion ------------------------------------------------------------------------------------------------
    # attempt to make R flexible with data types
    # R functions guess what was meant before throwing an error
    
    # trying to combine, numbers and characters
    x <- c(1, "canada", 3)
    # but we dont get one, not even a warning (look at x and its class)
    x
    
    class(x)
    
    # R coereced the data into character becuase you put a character string in the vector
    # turn numbers into characters
    x <- 1:5
    y <- as.character(x)
    y
    # you can turn it back as.numeric:
    as.numeric(y)
# this function is quite useful since datasets that include numbers as character strings are common

# Not availables (NA) --------------------------------------------------------------------------------------
    # when a function tries to coerce one tpye of another and encouters an impossible case, it usually gives use a warning
    # and turns the entry into a special value called an NA for "not available"
    x <- c("1", "b", "3")
    as.numeric(x)
    # R does not have any guesses for what number you want then you type "b" so it does not try

# Exercises ================================================================================================
    
    # 1. creating a function c as a vector
        temp <- c("Beijing" = 35, "Lagos" = 88, "Paris" = 42, "Rio de Janeiro" = 84, "San Juan" = 81, "Toronto" = 30)
    # 2. create a vector with the city names
        city <- names(temp)
    # 3. use the names fucntion and the objects defined in the previous exercising to assoicate the temp data
        names(codes) <-country
        # using the names function
        codes <- c(35, 88, 42, 84, 81, 30)
        country <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
        names(codes) <- country
        codes
    # 4/5. Using [ and : operators to access the temperature of the first cities on the lsit
        codes[1:3]
        codes[c(3,5)]
    # 6. use the (:) to create a sequence of numers
        seq(12,73,1)
    # 7. Creating a vector containing all the positive odd numbers smaller than 100
        ans <- seq(0,100,2)
    # 8. create a vector of numbers that starts at 6, does not pass 55, and adds numbers in increments of 4/7
        ans <- sum(seq(6,55, by= ((1/4))))
        ans
    # 9. what is the class of the following object? a <- seq(1, 10, 0.5)
        a <- seq(1, 10, 0.5)
        class(a)
        # numeric
    # 10. what is the class of the following object? a <- seq(1, 10)
        a <- seq(1, 10)
        class(a)
    # 11. the class of class(a<-1) is numeric, not integer. R defaults to numeric and to force an integer, you need to add the letter L
        as.integer(a)
        class(a)
    # 12. Define the following vector 
        x <- c("1", "3", "5")
        as.integer(x)

# Sorting -----------------------------------------------------------------------------------------------------------------------------------------
        
        # sort ---------------------
        # the function "sort" sorts a vector in increasing order
        library(dslabs)
        data(murders)
        sort(murders$total)
        # however this does not give us information about which states have which murder totals
        
        
        # ORDER --------------------
        # Function "order" is closer to what we want. takes vector as input and returns the vector of indexes that sorts the input vector
        x <- c(31, 4, 15, 92, 65)
        sort(x)
        # rather than sort the input vector, the function "order" returns the idex that sorts input vector:
        index <- order(x)
        x[index]
        # same output as that returned by sort(x) 
        x
        order(x)
        # The second entry of x is the smallest, so order(x) starts with 2. The next smallest is the third entry, so the second entry is 3 and so on.
        
        
        # order states by murders
        murders$state[1:10]
        murders$abb[1:10]
        # we can order the state names by their total murders. 
        ind <- order(murders$state)
        which.min(murders$abb[ind])
        
# max and which.max -------------------------------------------------------------------------------------------------------------------------------------------
        # largest value "max"
        max(murders$total)
        #and which.max for the index of the largest value:
        i_max <- which.max(murders$total)
        # SAME FOR MIN
# Rank -------------------------------------------------------------------------------------------------------------------------------------------------------
        # rank is related to order and can be useful. 
        x <- c(31, 4, 15, 92, 65)
        rank(x)
# Beware of RECYCLING ---------------------------------------------------------------------------------------------------------------------------------------------
        x <- c(1,2,3)
        y <- c(10, 20, 30, 40, 50, 60, 70)
        x+y
        
# EXERCISE --------------------------------------------------------------------------------------------------------------------------------------------------------------
        
        library(dslab)
        data("murders")
        # 1. Use the $ operator to access the population size data and store it as the object pop
        # Then use the sort function to redefine pop so that it is sorted. Finally, use the [ operator to report the smallest population size.
        pop = which.min(sort(murders$population))
        pop
        x <- order((murders$population))
        
      # rather than sort the input vector, the function "order" returns the idex that sorts input vector:
        index <- order(x)
        index
        # Create data frame using the data.frame function. 
        temp <- c(35, 88, 42, 84, 81, 30)
        city <- c("beijing", "Lagos", "paris", "Rio", "san juan", "toronto")
        city_temps <- data.frame(name = city, temperature = temp)
        ?rank
        ranks <- rank((murders$population))
        sort(ranks)
        # 7. na_example vector represents a series of counts. 
          data("na_example")
          str(na_example)
          mean(na_example)
          ind <- is.na(na_example)
          sum(ind)
          
# Vector Arithmetics -----------------------------------------------------------------------------------------------------------
          
          library(dslabs)
          data("murders")
          murders$state[which.max((murders$population)/100000)]
          
          # rescaling the vector
          inches <- (((c(69, 62, 66, 70, 70, 73, 67, 73, 67, 70))*2.54)-69)
          # two vectors
          murder_rate <- murders$total / murders$population * 100000
          murders$state[order(murder_rate)]
# EXERCISES --------------------------------------------------------------------------------------------------
          
          temp <- c(35, 88, 42, 84, 81, 30)
          temp <- ((5/9)*(temp-32))
          city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
          city_temps <- data.frame(name = city, temperature = temp)
# indexing --------------------------------------------------------------------------------------------------------
          library(dslabs)
          data("murders")
          # subsetting with logicals
          murder_rate <- murders$total / murders$population * 100000 
          ind <- murder_rate < 0.71
          # if instead we want to know if a value is less or equal 
          ind <- murder_rate <= 0.71
          ind
          (murders$state[ind])
          sum(ind)        
# Logical Operators --------------------------------------------------------------------------------------------
          TRUE & TRUE
          TRUE & FALSE
          FALSE & TRUE
          FALSE & FALSE
          
          west <- murders$region == "west"
          safe <- murder_rate <= 1
        murders$region[safe]
        
# which -------------
        ind <- which(murders$state == "California")
        murder_rate[ind]
# match -------------
        ind <- match(c("New York", "Florida", "Texas"), murders$state)
        ind
# %in% --------------
        c("Boston", "Dakota", "Washington") %in% murders$state
        # connection between "match" and %in% and "which"
        match(c("New York", "Florida", "Texas"), murders$state)
        which(murders$state%in%c("New York", "Florida", "Texas"))

# Exercises -----------------------------------------------------------------------------------------------------
        murder_rate <- murders$total / murders$population * 100000
        ind <- murder_rate < 1.0
        nw <- (murders$region == "west" )
        ne <- (murders$region == "east")
        
        murder_rate <- murders$total / murders$population * 100000
        low <- murder_rate < 1.0
        (murders$state[low])
        
        x <- murders$population / 10^6
        y <- murders$total
        plot(x,y)
        with(murders, plot(population, total))
        
        x <- with(murders, total / population * 100000)
        hist(x)
        murders$state[which.max(x)]
        murders$rate <- with(murders, total / population * 100000)
        boxplot(rate~region, data = murders)
        
        x <- matrix(1:120, 12, 10)
        image(x)
        
        
        
# # # # ###########################################################################################################
        ###########################################################################################################
        ###########################################################################################################
        ###########################################################################################################
        
        
        # CHAPTER 4 PROGRAMMING BASICS
        
        
        # Conditional Expressions
        a <- 4
        
        if (a!=0){
          print(1/a)
        }else{
          print(" NO reciprcal for 0.")
        }
        
        # USA MURDERS DATA FRAME
        library(dslabs)
        data(murders)
        murder_rate <- murders$total / murders$population * 100000      
        
        ind <- which.max(murder_rate)
        
        if(murder_rate[ind] <.25){
          print(murders$state[ind])
        }else{
            print(" No state has murder rate that low")
          }
        
        # ifelse -------------------------------------
        a <- 1
        ifelse( a > 0, 1/a, NA)
        
        a <- c(0,1,2,-4,5)
        result <- ifelse(a > 0, 1/a, NA)
        result
        
        # ---- Replacing missinig values
        data(na_example)
        no_nas <- ifelse(is.na(na_example), 0, na_example)
        sum(is.na(no_nas))
        
        # Defining Functions ----------------------------
        avg <- function(x){
          s <- sum(x)
          n <- lenght(x)
          s/n
        }
        # avg function computes the mean
        x <- 1:100
        identical(mean(x), avg(x))
        
## --------------------- CHAPTER 5 THE TIDYVERSE -------------------------------------------------------------
        library(tidyverse)
        murders
        # Tidy data
        tidyverse_update()
        library(tidyverse)
        data(co2)
        co2
        is.data.frame(co2)
        co2 <- tibble::as_data_frame(co2)
        co2
        
        
        
    