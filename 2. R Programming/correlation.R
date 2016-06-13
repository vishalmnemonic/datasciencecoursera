dir <- ("C:/Users/Keshav/Videos/specdata")

corr <- function(directory, threshold=0){
  setwd(directory)
  files <- list.files(directory)
  vect <- c()
  for(i in 1:length(files)){
    csv <- read.csv(files[i])
    if(sum(complete.cases(csv)) > threshold){
      csv <- csv[which(complete.cases(csv)),]
      corr <- cor(csv$sulfate, csv$nitrate)
      vect <- c(vect, corr)
    }
  }
  vect
}

cr <- corr(dir, 150)
head(cr)
summary(cr)

cr <- corr(dir, 400)
head(cr)
summary(cr)

cr <- corr(dir, 5000)
head(cr)
summary(cr)

cr <- corr(dir)
head(cr)
summary(cr)
length(cr)