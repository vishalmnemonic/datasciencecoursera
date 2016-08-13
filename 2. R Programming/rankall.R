setwd("C:/Users/Keshav/Videos")

rankall <- function(outcome, num = "best"){
  # Read the file
  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  validState = sort(unique(x[, 7]))
  
  if(outcome == "heart attack")
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  else if(outcome == "heart failure")
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  else column <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  
  hosp <- c()
  
  for(i in seq_along(validState)){
    y <- x[x$State == validState[i], ]
    
    # order data by outcome
    sorted_x <- y[order(as.numeric(y[[column]]),y[["Hospital.Name"]],decreasing=FALSE, na.last=NA), ]
    
    z = num
    if (z == "best") z = 1
    if (z == 'worst') z = nrow(sorted_x)
    
    hosp[i] <- sorted_x[z, "Hospital.Name"]
  }
  data.frame(hospital = hosp, state = validState, row.names = validState)
}