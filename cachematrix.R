## This is a pair of functions that creates an object
## that is a subclass of matrix, and enables the
## computation and caching of its inverse

## This function defines a S4 class called "myMatrix" that 
## is a subclass of matrix. The class myMatrix has a slot
## that is intended for the caching of the matrix's inverse.
##
## Given a matrix, this function creates a an instance of
## "myMatrix" and returns it.

makeCacheMatrix <- function(x = matrix()) {
  setClass("myMatrix", representation(invertedMatrix="NULL"), contains="matrix");
  return(new("myMatrix", x));
}


## Given an instance of "myMatrix", this function returns
## its inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  if (is.null(x@invertedMatrix)) {
    x@invertedMatrix = solve(x);
  }
  return x@invertedMatrix;
}