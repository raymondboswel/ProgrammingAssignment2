## This script exposes a function, makeCacheMatrix, which defines an object that 
## stores a matrix as well as it's inverse. The inverse of the matrix is
## retrieved using the cacheSolve function, which retrieves the cached value,
## or creates it if it doesn't exist.

## This function defines a special "matrix", which is really a list containing
## a set of functions to get/set the matrix and get/set the inverse of the
## matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse, 
       getInverse = getInverse)
}


## If the given cacheMatrix object x has a non null inverse, this value
## will be returned, else the inverse will be computed and stored in the
## x matrix, and returned.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(!is.null(inverse)) {
    message("Getting cached inverse")
    return(m)
  } 
  matrix <- x$get()
  inv <- solve(matrix)
}
