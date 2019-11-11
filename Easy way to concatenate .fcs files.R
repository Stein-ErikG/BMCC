setwd('/Users/mmasg/Downloads/debarcoded/') # Where are the files you want to concatenate?
files  <- list.files(pattern = ".fcs") # Use the pattern to recognize tha .fcs files you want to concatenate
files # See what you have chose.
concatenate_fcs_files(files, output.file = "concatenated.fcs") # Concatenate file files. You chould make a more informative file name:)
