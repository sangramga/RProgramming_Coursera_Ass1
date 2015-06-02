corr <- function(directory,threshold = 0)
{
  nobs <- integer()
  vec <- numeric()
  for(i in 1:332)
  {
    
    if(i <=9 )
      path.i <- paste("~/",directory,"/","00",as.character(i),".csv",sep ="")
    else if(i<=99 && i >=10)
      path.i <- paste("~/",directory,"/","0",as.character(i),".csv",sep = "")
    else
      path.i <- paste("~/",directory,"/",as.character(i),".csv",sep = "")
    
    df <- read.csv(skip = 1,col.names = c("Date","sulfate","nitrate","ID"),sep = ",",file = path.i)
    
    nobs[i] <- sum(complete.cases(df))
    
    if(nobs[i]>=threshold)
      {
      correl <- cor(df$sulfate,df$nitrate,use = "pairwise.complete.obs")  
      vec <- c(vec,correl)
        
      }
    
    i <- i+ 1
    
  }
  vec
}