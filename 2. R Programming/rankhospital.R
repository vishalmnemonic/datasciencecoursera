setwd("C:/Users/Keshav/Videos")

rankhospital <- function(state, outcome, num = "best"){
  # Read the file
  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  validState = unique(x[,7])
  if (!state %in% validState) stop("invalid state")
  
  if(outcome == "heart attack")
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  else if(outcome == "heart failure")
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  else column <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  
  ## Return hospital name in that state with the given rank 30-day death rate
  x <- x[x$State==state,]
  
  # order data by outcome
  sorted_x <- x[order(as.numeric(x[[column]]),x[["Hospital.Name"]],decreasing=FALSE, na.last=NA), ]
  
  #handle num input
  if (num=="best") num = 1
  if (num=='worst') num = nrow(sorted_x)
  #will automatically return NA if num > nrow, as well as if it's some other text value
  # if someone passes num < 1, they'll get what's expected
  #if (is.numeric(num) & num > nrow(sorted.data.state) return(NA)
  
  sorted_x[num,"Hospital.Name"]
}