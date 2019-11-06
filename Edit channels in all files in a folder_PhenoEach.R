library("flowCore")

## Fix the PhenoEach K30 channels in all files in a folder (data_dir)

data_dir = '/Users/mmasg/Dropbox/Rstudio/Parker_ICI/Caroline data/renamed/'
setwd('/Users/mmasg/Dropbox/Rstudio/Parker_ICI/Caroline data/renamed/')
files  <- list.files(pattern = "_edited_2.fcs")
files

library(premessa)
concatenate_fcs_files(files, output.file = '/Users/mmasg/Dropbox/Rstudio/Parker_ICI/Caroline data/renamed/pool.fcs')

ff <- read.flowSet(files[1])
pData(ff[[1]]@parameters)

for (file in files){
  ff <- read.FCS(file)
  file_name <- file
  ff@parameters@data$name[66] = "PhenoGraph Each K30"
  ff@parameters@data$desc[66] = "PhenoGraph Each K30"
  colnames(ff@exprs)[66] = "PhenoGraph Each K30"
  ff@description$`$P66N` = "PhenoGraph Each K30"
  ff@description$`$P66S` = "PhenoGraph Each K30"
  ff@exprs[,1:62] = 5*(sinh(ff@exprs[,1:62]))
  new_file_name <- gsub(".fcs", "_transrelabelled.fcs", file_name)
  write.FCS(ff, filename = paste0(data_dir, new_file_name), what="numeric", delimiter = "\\")
}

for (file in files){
  ff <- read.FCS(file)
  file_name <- file
  ff@parameters@data$name[36] = "PhenoGraph Each K30"
  ff@parameters@data$desc[36] = "PhenoGraph Each K30"
  colnames(ff@exprs)[36] = "PhenoGraph Each K30"
  ff@description$`$P36N` = "PhenoGraph Each K30"
  ff@description$`$P36S` = "PhenoGraph Each K30"
  
  ff@parameters@data$name[38] = "PhenoGraph Each K15"
  ff@parameters@data$desc[38] = "PhenoGraph Each K15"
  colnames(ff@exprs)[38] = "PhenoGraph Each K15"
  ff@description$`$P38N` = "PhenoGraph Each K15"
  ff@description$`$P38S` = "PhenoGraph Each K15"
  
  new_file_name <- gsub(".fcs", "_edited_2.fcs", file_name)
  write.FCS(ff, filename = paste0(data_dir, new_file_name), what="numeric", delimiter = "\\")
} 

new_files  <- list.files(pattern = "_edited.fcs")
NNVdataset <- read.flowSet(new_files)
pData(NNVdataset[[1]]@parameters)


x=5


y =(asinh((x)/5))



