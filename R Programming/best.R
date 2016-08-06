
best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!state%in%data[,7])stop("invalid state")
  if(!outcome%in%c("heart attack","heart failure","pneumonia"))stop("invalid outcome")
  
  temp <- data[,c(2,7,11,17,23)]
  temp[temp=="Not Available"] <- NA
  colnames(temp) <-c("Hospital.Name","State","heart attack","heart failure","pneumonia")
  m <- temp[temp$State==state,c("Hospital.Name",outcome)]
  m <- na.omit(m)
  m[,outcome] <- as.numeric(m[,outcome])
  m <- m[m[,outcome]==min(m[,outcome]),]
  ## Return hospital name in that state with lowest 30-day death rate
  sort(m$Hospital.Name)
  

}


source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
submit()





