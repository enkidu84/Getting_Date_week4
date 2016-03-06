## The combination of these two functions allows to cache the inverse of matrices that have been calculated before

## prepare the matrix and write the necessary functions

makeCacheMatrix <- function(x = matrix()) {

i <- NULL
get <- function() x
setinv <- function(inverse) i <<- inverse
getinv <- function () i

list( get = get,
             setinv = setinv,
             getinv= getinv)


}


## pull the cached inverse or calculate if the matrix is unknown

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		
		inv = x$getinv()
		
		        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
				}
		data <- x$get()
		inverse = solve(data)
		x$setinv(inverse)
		inverse
}
