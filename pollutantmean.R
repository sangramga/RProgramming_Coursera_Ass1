pollutantmean <- function(directory,pollutant,id = 1:332)
{
  nobs <- 0
  sums <- 0
  vnew <- numeric()
  
 
  for(i in id)
  {
    
    if(i <=9 )
      path.i <- paste("~/",directory,"/","00",as.character(i),".csv",sep ="")
    else if(i<=99 && i >=10)
      path.i <- paste("~/",directory,"/","0",as.character(i),".csv",sep = "")
    else
      path.i <- paste("~/",directory,"/",as.character(i),".csv",sep = "")
      
    df <- read.csv(skip = 1,col.names = c("Date","sulfate","nitrate","ID"),sep = ",",file = path.i)
    v <- df[[pollutant]]
    vnew <- c(vnew,v[!is.na(v)])
    i <- i+ 1
   
  }
  
    mean(vnew)
    
  
}