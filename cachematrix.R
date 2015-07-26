## This script contains a function that creates a matrix that caches the inverse of the matrix
## and an other function to retrieve the cached value

## Creates a 'special' matrix with the ability to cache data

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() {
    x
  }
  setinverse <- function(inverse) {
    i <<- inverse
  }
  getinverse <- function() {
    i
  }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}
## Get the inverse if it exisits, otherwise it calculates and sets the inverse

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- sovle(data, ...)
  x$setinverse(i)
  i
        ## Return a matrix that is the inverse of 'x'
}
