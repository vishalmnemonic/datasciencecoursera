dir <- ("C:/Users/Keshav/Videos/specdata")


pollutantmean <- function(directory, pollutant, id){
  setwd(directory)
  files <- list.files(directory)
  frame <- data.frame()
  for(i in id)
    frame <- rbind(frame, read.csv(files[i]))
  mean(frame[, pollutant], na.rm = TRUE)
}

pollutantmean(dir, "sulfate", 1:10)
pollutantmean(dir, "nitrate", 70:72)
pollutantmean(dir, "nitrate", 23)