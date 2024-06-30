## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  error = TRUE
)

## -----------------------------------------------------------------------------
library(erify)

## -----------------------------------------------------------------------------
# print `what` `n` times
emphasize <- function(what, n) {
  for (i in 1:n) {
    cat(what, "\n")
  }
}

# example
emphasize("You're beautiful!", 3)

## -----------------------------------------------------------------------------
emphasize(c, 3)

## -----------------------------------------------------------------------------
emphasize <- function(what, n) {
  # check the type of `what`
  check_type(what, "character")
  
  # main
  for (i in 1:n) {
    cat(what, "\n")
  }
}

emphasize(c, 3)

## -----------------------------------------------------------------------------
emphasize <- function(what, n) {
  # check the type of `what`
  check_type(what, "character")
  # check the length of `what`
  check_length(what, 1)
  
  # main
  for (i in 1:n) {
    cat(what, "\n")
  }
}

emphasize(c("apple", "orange"), 3)

## -----------------------------------------------------------------------------
emphasize <- function(what, n) {
  # check the type of `what`
  check_type(what, "character")
  # check the length of `what`
  check_length(what, c(0, NA))
  
  # main
  for (i in 1:n) {
    cat(what, "\n")
  }
}

emphasize(character(0), 3)

## -----------------------------------------------------------------------------
emphasize("You're beautiful again!", 3)

## -----------------------------------------------------------------------------
arg <- "I'm invalid."

# check the content of `arg`
check_content(arg, c("yes", "no"))

## -----------------------------------------------------------------------------
check_content(arg, c("yes", "no"), general = "You are wrong.")

## -----------------------------------------------------------------------------
check_content(arg, c("yes", "no"), specific = "You are wrong.")

## -----------------------------------------------------------------------------
supplement <- c(x = "You're wrong.", i = "But you're beautiful.")
check_content(arg, c("yes", "no"), supplement = supplement)

## -----------------------------------------------------------------------------
general <- "You're beautiful."

specifics <- c(
  i = "Your eyes are big.",
  i = "Your hair is long.",
  x = "But you broke my heart."
)

throw(general, specifics)

## -----------------------------------------------------------------------------
throw(general, specifics, as = "message")

## -----------------------------------------------------------------------------
check_positive <- function(x) {
  check_type(x, c("integer", "double"))
  check_length(x, 1)
  
  if (is.na(x) || x <= 0) {
    general <- "`x` must be a positive number."
    specifics <- "`x` is `{x}`."
    throw(general, specifics, env = list(x = x))
  }
}

check_positive(-2)

## -----------------------------------------------------------------------------
x <- c("Pink Floyd", "Pink Freud", "Pink Florida")
join(x, "and")

## -----------------------------------------------------------------------------
cat(back_quote(x))

back_quote(c(1, 2, NA))

## -----------------------------------------------------------------------------
arg <- "Pink Florence"
check_content(arg, x)

