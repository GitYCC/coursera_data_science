## Matrix inversion is usually a costly computation.
## There may be some benefit to caching the inverse of a matrix
## rather than compute it repeatedly.


## creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    solve_matrix <- NULL
    setMatrix <- function(mtx) {
        x <<- mtx
        solve_matrix <<- NULL
    }
    getMatrix <- function() return(x)
    setSolve <- function(sol) solve_matrix <<- sol
    getSolve <- function() return (solve_matrix)
    list(setMatrix=setMatrix,getMatrix=getMatrix,
         setSolve=setSolve,getSolve=getSolve)

}


## computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    solve_matrix <- x$getSolve()
    if(!is.null(solve_matrix)) {
        message("getting cached data")
        return(solve_matrix)
    }
    data <- x$getMatrix()
    solve_matrix <- solve(data,...)
    x$setSolve(solve_matrix)
    
    return(solve_matrix)

}
