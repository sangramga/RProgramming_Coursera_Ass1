complete <- function(directory,id = 1:332)
{
  nobs <- integer()
  myid <- integer()
  
  
  
  for(i in id)
  {
    
    if(i <=9 )
      path.i <- paste("~/",directory,"/","00",as.character(i),".csv",sep ="")
    else if(i<=99 && i >=10)
      path.i <- paste("~/",directory,"/","0",as.character(i),".csv",sep = "")
    else
      path.i <- paste("~/",directory,"/",as.character(i),".csv",sep = "")
    
    df <- read.csv(skip = 1,col.names = c("Date","sulfate","nitrate","ID"),sep = ",",file = path.i)
    
    nobs <- c(nobs,sum(complete.cases(df)))
        
    i <- i+ 1
    
  }
  data.frame(id = id,nobs = nobs)
}