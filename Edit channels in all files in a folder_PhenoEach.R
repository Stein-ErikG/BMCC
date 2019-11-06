library("flowCore")

## Fix the name of a channel in one ore more .fcs files in a folder (data_dir).
## Need this if you have used Phenograph in Matlab/SightOf on more than one file

data_dir = '/Users/mmasg/Dropbox/Rstudio/Parker_ICI/Caroline data/renamed/'
setwd('/Users/mmasg/Dropbox/Rstudio/Parker_ICI/Caroline data/renamed/')
files  <- list.files(pattern = ".fcs") # Use pattern if you need to select certain .fcs files
files # View your selection

ff <- read.flowSet(files[1]) # Read the first .fcs files
pData(ff[[1]]@parameters) # Have a look at you channels to find the channel number you want to change
                          # In the example below we need to change the 66th channel to "PhenoGraph Each K30"

for (file in files){
  ff <- read.FCS(file)
  file_name <- file # Store the filename so that it can be edited for saving later
  ff@parameters@data$name[66] = "PhenoGraph Each K30"
  ff@parameters@data$desc[66] = "PhenoGraph Each K30"
  colnames(ff@exprs)[66] = "PhenoGraph Each K30"
  ff@description$`$P66N` = "PhenoGraph Each K30"
  ff@description$`$P66S` = "PhenoGraph Each K30"
  #ff@exprs[,1:62] = 5*(sinh(ff@exprs[,1:62])) # This reverses the arcsinh transformation. Dont use if you dont need
  new_file_name <- gsub(".fcs", "_transrelabelled.fcs", file_name) # Makes new filename. You can edit "_transrelabelled.fcs" 
  write.FCS(ff, filename = paste0(data_dir, new_file_name), what="numeric", delimiter = "\\") # Save the edited file. 
}
