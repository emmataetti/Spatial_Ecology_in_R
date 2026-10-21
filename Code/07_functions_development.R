# this code will develop user based funcions

# My functions!

somma <- function(num1,num2){
  z=num1+num2
  return(z)
  }

somma(num1,num2)
somma(3,5)

# exercise: build the function to multiply two numbers (*)

multiply <- function(num1,num2){
z=num1*num2
return(z)
}

multiply(3,4)

# ex: develop your own functions to make the sum of three numbers

somma3 <- function(num1,num2,num3){
z=num1+num2+num3
return(z)
}

somma3(3,4,5)

# you can assign this to an obj 
obj <-somma3(3,4,5)

# a very annoing situation is related to the funtion par which is difficult to understandnction
# in this case no return function because it's a graphical fu
mf <- function(nx,ny){
   par(mfrow=c(nx, ny))
}
  
mf(1,2)
plot(3,5)
plot(6,7)

# put default values inside the function
mfdef <- function(nx=2,ny=1){
   par(mfrow=c(nx, ny))
}

mfdef() # no rguments inside because is default
plot(3,5)
plot(6,7)

# you can still change the default value
mfdef(3,1)
plot(3,5)
plot(6,7)

#suggestion: one you develop a function is better to use default, you can still change the default values but you can just use mfdef() and it will still works

# new operator:if else
# using the operator if else to look if a number is positive or negative
# we develop a function which tell us if the function? is positive o negative

amIpositive <- function(x){
 if(x>0) {
   print("this number is positive, are you drunk?")   # use quotes because is a message
   }
  else {
    print("this number is negative, idiot")
  }
}

amIpositive(98)
amIpositive(-98)

# considering all the potential cases
amIpositive <- function(x){
 if(x>0) {
   print("this number is positive, are you drunk?")   # use quotes because is a message
   }
  else if(x<0) {
    print("this number is negative, idiot")
  }
  else {
    print("Zero is nor positive nor negative")
    }
}

 amIpositive(98) # "this number is positive, are you drunk?"
 amIpositive(-98) # "this number is negative, idiot"
 amIpositive(0) # "Zero is nor positive nor negative"

# how to develop for loops
loop <- function() {
 for (i in 1:10) {
   print(i)
   }
  }

loop()

# ex: develop a loop whicjh will print 13000 numbers from 1 to 13000
loop <- function() {
 for (i in 1:13000) {
   print(i)
   }
  }
loop()

# loop with a operation inside
loop2 <- function() {
 for (i in 1:10) {
   multi <-i * 4
   print(multi)
   }
  }
loop2()

# ex: make the loop with the power operator (elevation)
loop2 <- function() {
 for (i in 1:10) {
   power <-i ^ 4
   print(power)
   }
  }
loop2()

# you can make any kind of series, for ex i can do from 1 to 13000
loop2 <- function() {
 for (i in 1:13000) {
   power <-i ^ 4
   print(power)
   }
  }
loop2()

# there is also way to make file trought the function sink(name o the file)
sink("numbers.txt")
loop2()

