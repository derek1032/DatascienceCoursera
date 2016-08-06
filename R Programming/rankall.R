rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!outcome%in%c("heart attack","heart failure","pneumonia"))stop("invalid outcome")
  ## For each state, find the hospital of the given rank
  temp <- data[,c(2,7,11,17,23)]
  temp[temp=="Not Available"] <- NA
  colnames(temp) <-c("Hospital.Name","State","heart attack","heart failure","pneumonia")
  
  m <- temp[,c("State","Hospital.Name",outcome)]
  m <- na.omit(m)
  m[,outcome] <- as.numeric(m[,outcome])
  m <- m[order(m$State,m[,outcome],m[,"Hospital.Name"]),]
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  level <- levels(factor(m$State))
  all <- data.frame()
  
  for(i in level){
    if(num=="best"){
      n <- 1
    }else if(num=="worst"){
      n <- nrow(m[m$State==i,])
    }else{
      n <- num
    }
    all <- rbind(all,m[m$State==i,][n,])  
  }
  all
  ranking <- all[,c(2,1)]
  colnames(ranking) <- c("hospital","state")
  rownames(ranking) <- level
  ranking$state <- level
  ranking
}
