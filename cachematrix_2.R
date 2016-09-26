## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
        m <- x$getmean()
        if(!is.null(m)) {
                message("Getting cached data")
                return(m)
                
        }
        else {
                data <- x$get()
                print(m)
                print(data)
                inverseMatrix <- solve(data)
                x$setmean(inverseMatrix)
                return(inverseMatrix)
        }
}

mvec <- makeCacheMatrix()
mvec$set(matrix(c(1,2,3,4),2,2))
mvec$get()

cacheSolve(mvec)
