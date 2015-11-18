## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# makeInvVector creates a special "vector"  which 
# is really a list containing a function to
# 1. set the value of the vector
# 2. get the value of the vector
# 3. set the value of the inverse
# 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {

        
        makeInvVector <- function(x = matrix()) {
                r <- NULL
                set <- function(y) {
                        x <<- y
                        r <<- NULL
                }
                get <- function() x
                setinv <-function(solve) r <<- solve
                getinv <- function() r
                list(set = set, get = get, 
                     setinv = setinv, 
                     getinv = getinv)
        }


## Write a short comment describing this function


        # The following function calculates the mean of 
        # the special "vector" created with the above function. 
        # However, it first checks to see if the mean 
        # has already been calculated. If so, it gets the mean 
        # from the cache and skips the computation. 
        # Otherwise, it calculates the mean of the data and 
        # sets the value of the mean in the cache 
        # via the setmean function.
        
        cacheSolve <- function(x, ...) {
                r <- x$getinv()
                
                if(!is.null(r)) {
                        message("getting cached data")
                        return(r)
                }
                data <- x$get()
                r <- solve(data, ...)
                x$setinv(r)
                r
        }
}