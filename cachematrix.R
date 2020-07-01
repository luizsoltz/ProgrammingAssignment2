## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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

## Write a short comment describing this function

cacheSolve <- function(a, ...) {
          x <- a$getinverse()
  if (!is.null(x)) {
          message("getting cached data")
          return(x)
  }
  data <- a$get()
  x <- solve(data, ...)
  a$setinverse(x)
  x     
        ## Return a matrix that is the inverse of 'x'
}
