dir <- ("C:/Users/Keshav/Videos/specdata")

complete <- function(directory, id){
  setwd(directory)
  files <- list.files(directory)
  frame <- data.frame()
  for(i in id){
    obs <- sum(complete.cases(read.csv(files[i])))
    tmp <- data.frame(i, obs)
    frame <- rbind(frame, tmp)
  }
  colnames(frame) <- c("id", "nobs")
  frame
}

complete(dir, 1)
complete(dir, c(2, 4, 8, 10, 12))
complete(dir, 30:25)
complete(dir, 3)