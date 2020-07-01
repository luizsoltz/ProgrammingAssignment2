# makeCacheMatrix creates a matrix object that can cache its inverse.
# It returns a list of functions
# set - set the value of the matrix
# get - get ''   ''   ''    ''
# setinv - set the inverse
# getinv - get ''    ''

makeCacheMatrix <- function(a = matrix()) {
    x <- NULL
  set <- function(b) {
          a <<- b
          x <<- NULL
  }
  get <- function() a
  setinverse <- function(inverse) x <<- inverse
  getinverse <- function() x
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# cacheSolve returns the inverse: either retrieves the inverse from cache (if available), using getinv
# returned by makeCacheMatrix, or calculates the inverse using solve, and stores it in cache
# using setinv returned by makeCacheMatrix.

cacheSolve <- function(a, ...) {
  x <- a$getinverse()                                   # retrieve inverse from cache
  if (!is.null(x)) {                                    # if available, write the message "getting cached data", and return this inverse
          message("getting cached data")
          return(x)
  }
  data <- a$get()                                      # if inverse is not yet available, get the matrix and store it in data
  x <- solve(data, ...)                                # use the solve function to calculate the inverse, and store it in inv
  a$setinverse(x)                                      # put inverse in cache
  x                                                    # return the inverse
}
