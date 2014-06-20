## Create a function called makeCacheMatrix 
## Set values of the matrix
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
## gets the fuction & returns x ie the matrix  
  get<-function() x
## sets the value of the inverse Matrix
  setinverse<-function(solve) m<<- solve
## gets the value of the inverse matrix
  getinverse<-function() m
  list(set=set, get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}
## Create a function called cacheSolve
cacheSolve <- function(x=matrix(), ...) {
## Checks to see if values of inverse already exists in the 
## environment  
  m<-x$getinverse()
## If the inverse DOES exist then returns cached value
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
##If the inverse DOES NOT then calculates and stores
## the inverse matrix
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setinverse(m)
  m
}

