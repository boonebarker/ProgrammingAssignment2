## Filename: cachematrix.R
## Written by: Roger Peng, Boone Barker
## Date: December 20, 2015

# in this file are a pair of functions that cache the
# inverse of a matrix. With the cache, calculating the inverse of
# the same matrix again is not necessary; it can be retrieved from the cache.

# The following function creates a special "matrix" object that 
# can cache its inverse.

## Filename: cachematrix.R
## Written by: Roger Peng, Boone Barker
## Date: December 20, 2015

# in this file are a pair of functions that cache the
# inverse of a matrix. With the cache, calculating the inverse of
# the same matrix again is not necessary; it can be retrieved from the cache.

# The following function creates a special "matrix" object that 
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
