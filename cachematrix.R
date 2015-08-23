## This set of functtions calculates the inverse of a matrix
## If its stored in memory, returns the value

## This function receives an invertible matrix
## Additionally you can pass its inverse and it's stored in memory
## Returns a list

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function solves the inverse matrix of a list containing a matrix as described by the previous function
## First, evaluates if the inverse is already stored in cache memory within the list
## If not, calculates its inverse

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)         ## Return a matrix that is the inverse of the passed argument
    m
}
