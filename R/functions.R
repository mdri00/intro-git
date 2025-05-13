add_one <- function(x) {
  x + 1
}

add_two <- function(x) {
  x <- add_one(add_one(x))
  return(x)
}


# ** Uncomment and commit changes before starting scenario 2 **
# add_n <- function(x, n) {
#
#   for (i in 1:n) {
#    x <- add_one(x)
#   }
#
#   return(x)
# }
