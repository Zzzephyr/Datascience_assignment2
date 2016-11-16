## The lexical scoping assignment in R Programming takes advantage of lexical scoping and the fact 
## that functions that return objects of type list() also allow access to any other objects defined 
## in the environment of the original function.

## The function below returns a list of four functions for the next funciton's use.

makeCacheMatrix <- function(m = matrix()) {
        cache <<- NULL
        set <- function(n) {
                m <<- n
                cache <<- NULL
        }
        get <- function() m
        setinverse <- function(inverse) cache <<- inverse
        getinverse <- function() cache
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)

}


## Because the four functions defined above have already been named, we can directly use $ to access the functions by name.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        y<- x$getinverse()
        if (!is.null(y)) {
                message("getting cached inverse")
                return(y)
        } else { 
                inverse <- solve(x$get())
                x$setinverse(inverse)
                inverse
        }
}
