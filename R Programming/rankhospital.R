rankhospital <- function(state, outcome, num = "best") {
  
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
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
  
  m <- m[order(m[,outcome],m[,"Hospital.Name"]),]
  
  ## Return hospital name in that state with lowest 30-day death rate
  if(num=="best"){
    m$Hospital.Name[1]
  }else if(num=="worst"){
    m$Hospital.Name[nrow(m)]
  }else{
    m$Hospital.Name[num]
  }

}
#rankhospital("TX", "heart failure", 4)
#rankhospital("MD", "heart attack", "worst")



