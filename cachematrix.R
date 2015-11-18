## Filename: cachematrix.R
## Written by: Roger Peng, Boone Barker
## Date: November 20, 2015

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
	setinverse <-function(inverse) r <<- inverse
	
	## get the value of the inverse
	getinverse <- function() r
	# Return a list of the four set/gets
	list(set = set, get = get, 
	     setinverse = setinverse, 
	     getinverse = getinverse)
}


# The following function returns the inverse of 
# the special "matrix" created with the above function, 
# either from the cache (if available) or by calculation.
cacheSolve <- function(x, ...) {

	# Get the inverse from makeCacheMatrix.
	# Will be null if not cached. Otherwise will
	# be the inverse.
	r <- x$getinverse()
	
	if(!is.null(r)) { # If true, inverse is cached.
		message("getting cached data")
		return(r) # returns the inverse
	}
	
	# Else, calculate the inverse
	data <- x$get() # gets the matrix
	r <- solve(data) # computes the inverse
	x$setinverse(r) #sets the cache
	r		# returns the inverse
}
