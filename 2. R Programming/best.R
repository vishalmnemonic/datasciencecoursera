setwd("C:/Users/Keshav/Videos")

best <- function(state, outcome){
  # Read the file
  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  validState = unique(x[, 7])
  if (!state %in% validState) stop("invalid state")
  
  if(outcome == "heart attack")
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  else if(outcome == "heart failure")
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  else column <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
 
  ## Return hospital name in that state with lowest 30-day death rate
  x <- x[x$State==state,]
  index <- which.min(x[, column])
  x[index, "Hospital.Name"]
}