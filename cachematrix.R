## Below are makeCacheMatrix and cacheSolve functions used to create an object used to store a matrix and caches it's inverse.

## The purpose of this function is it creates a matrix object that can cache it's inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, 
     get=get,
     setmatrix=setmatrix,
     getmatrix=getmatrix)

}


## The purpose of this function is it creates the inverse of the matrix created by the above makeCacheMatrix. 
## If the inverse has been calculated already and the matrix hasn't chaned, then the cashesolve will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m

}
