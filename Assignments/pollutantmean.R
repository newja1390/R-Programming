pollutantmean <- function(directory, pollutant, id = 1:332)
{
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  
  ###########################################################
  ### By newja1390
  ################
    
  lstFileName <- list.files(path = directory, full.names = TRUE)
  
  ##>>>>> First Slution, it doesn't work !!!
#   totalMeans <- 0
#   for(i in id)
#   {
#     dataset <- read.csv(lstFileName[i], header = TRUE, sep = ",")
#     m <- mean(dataset[, pollutant], na.rm = TRUE)
#     totalMeans<-totalMeans + m
#   }
#   totalMeans/length(id)

  ##>>>>> Second Slution
  dataset <- data.frame()
  for (i in id) 
  {
    dataset <- rbind(dataset, read.csv(lstFileName[i], header = TRUE, sep = ","))
  }
  mean(dataset[, pollutant], na.rm = TRUE)
}
   
