## These functions written in partial fulfillment of Coursera Data Science: R Programming 

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x= matrix()){
    inv <- NULL                             ## initialize inv as NULL; will hold value of matrix inverse 
    set <- function(y){                     ## define the set function to assign new value of matrix in parent environment
      x <<- y
      inv <<- NULL                          ## if there is a new matrix, reset inv to NULL
    }
    get <- function() {x}
    setInverse <- function(inverse) {inv <<- inverse}        ## assigns value of inv in parent environment
    getInverse <- function() {inv}
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data,...)
        x$setInverse(inv)
        inv   
}
