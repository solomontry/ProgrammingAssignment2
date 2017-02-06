## Put comments here that give an overall description of what your
## functions do

## This function creates a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
         }
        get <-function() x
        setinv <- function(inverse) m<<-inverse
        getinv <- function()m
        list(set = set, get =get, 
             setinv = setinv,
             getinv = getinv)
}


## It creates the inverse of the matrix returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInv()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        
        mat <-  x$get()
        m <- solve(mat, ...)
        x$setInv(m)
        m
}
