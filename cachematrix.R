## This set of functtions calculates the inverse of a matrix
## If its stored in memory, returns the value



## This function receives an invertible matrix
## Additionally you can pass its inverse and it's stored in memory
## Returns a list

makeCacheMatrix <- function(x = matrix()) {             ## Receives a matrix
    m <- NULL
    set <- function(y) {                                ## To set a new matrix and clears cache
        x <<- y
        m <<- NULL
    }
    get <- function() x                                 ## Returns current matrix
    setinverse <- function(inverse) m <<- inverse       ## Sets an inverse (don't verifies if matrix provided)
    getinverse <- function() m                          ## Returns inverse in cache
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)    ## List returned
}


## This function solves the inverse matrix of a list containing a matrix as described by the previous function
## First, evaluates if the inverse is already stored in cache memory within the list
## If not, calculates its inverse

cacheSolve <- function(x, ...) {                        ## To receive a list described in previous function
    m <- x$getinverse()                                 ## Gets cached inverse
    if(!is.null(m)) {                                   ## Evaluates if inverse cached, if yes, prints
        message("getting cached data")
        return(m)
    }
    data <- x$get()                                     ## If no inverse cached, get matrix
    m <- solve(data, ...)                               ## Calculates inverse
    x$setinverse(m)                                     ## Returns to list
    m
}
