###makeCacheMatrix: make a list to set and get the values of the matrix
makeCacheMatrix <- function(x=matrix()) {
  
  #inv: store the cached inverse matrix in inv
  #set: assign values of the matrix to symbols
  #get: get values to be processed
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  
  #setinv: assign the inverse of the matrix
  #getinv: get values of the inverse
  #list(): return a list with the functions above
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}



###cacheSolve: will compute the inverse of the matrix, if not already done
cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  
  #if inv has been calculated, return it
  if(!is.null(inv)) {
  return(inv)
  }
  
  #appearantly inv has not been calculated, so it computes it now 
  data <- x$get()
  inv <- solve(data, ...)
  
  #cache the inverse matrix
  x$setinv(inv)
  
  #return it
  inv
}



#if you want to test this with a matrix (1,2,3,4)
#and then inverse it to the correct solution (-2,1,1.5,-0.5)
#test this code by saving the code to source and typing in the following into the console:
#
#x = rbind(c(1,2),c(3,4))
#m = makeCacheMatrix(x)
#m$get()
#     [,1] [,2]
#[1,]    1    2
#[2,]    3    4
#
#cacheSolve(m)
#     [,1] [,2]
#[1,] -2.0  1.0
#[2,]  1.5 -0.5