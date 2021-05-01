## To create a special objet in which we can store the matrix we do the following code:

makeCacheMatrix <- function(x = matrix()) {
  nic <- NULL
  set <- function(y) {
    x <<- y
    nic <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) nic <<- inverse
  getinverse <- function() nic
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## To solve the inverse of the matrix created above, we must use cacheSolve:

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x' 
  nic <- x$getinverse()
  if(!is.null(nic)) {
    message("getting cached data")
    return(nic)
  }
  data <- x$get()
  nic <- inverse(data, ...)
  x$setinverse(nic)
  nic
}


