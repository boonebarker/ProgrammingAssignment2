## Filename: cachematrix.R
## Written by: Roger Peng, Boone Barker
## Date: November 20, 2015

<<<<<<< HEAD
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
=======
# in this file are a pair of functions that cache the
# inverse of a matrix. With the cache, calculating the inverse of
# the same matrix again is not necessary; it can be retrieved from the cache.

# makeCacheMatrix creates a special "matrix" object that 
# can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

        # Set the value of the "matrix" object       
	r <- NULL
	set <- function(y) {
		x <<- y
		r <<- NULL
	}
	
	# Get the value of the "matrix" object
	get <- function() x
	
	# Set the value of the inverse
	setinv <-function(inv) r <<- inv
	
	## get the value of the inverse
	getinv <- function() r
	# Return a list of the four set/gets
	list(set = set, get = get, 
	     setinv = setinv, 
	     getinv = getinv)
}


# The following function returns the inverse of 
# the special "matrix" created with the above function, 
# either from the cache (if available) or by calculation.
cacheSolve <- function(x, ...) {

	# Get the inverse from makeCacheMatrix.
	# Will be null if not cached. Otherwise will
	# be the inverse.
	r <- x$getinv()
	
	if(!is.null(r)) { # If true, inverse is cached.
		message("getting cached data")
		return(r) # returns the inverse
	}
	
	# Else, calculate the inverse
	data <- x$get() # gets the matrix
	r <- solve(data) # computes the inverse
	x$setinv(r) #sets the cache
	r		# returns the inverse
}
>>>>>>> origin/master
