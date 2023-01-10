# Read in .tif
mouse.tif <- tiff::readTIFF(here::here('data-raw/mini.tif'), all=TRUE) |> lapply(function(x) x[,,2])
message(sprintf('List size: %s \n', object.size(mouse.tif)))

# Make array
mouse.list <- purrr::reduce(mouse.tif, abind::abind, along = 3)
message(sprintf('List size: %s', object.size(mouse.list)))

# Reshape array to 4D
system.time(mouse.arr <- array(mouse.list, dim = c(300, 300, 139, 12)))
message(sprintf('Array size: %s', object.size(mouse.arr)))

# Select slices and timepoints
oligo <- mouse.arr[,,20:100,1:4] 
usethis::use_data(oligo, overwrite=TRUE)