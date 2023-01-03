#' converts list into final array
mouse.list <- readRDS('results/mouse.list')
system.time(mouse.arr <- array(mouse.list, dim = c(300, 300, 139, 12)))
message(sprintf('Array size: %s', object.size(mouse.arr)))
oligo <- mouse.arr[,,20:100,1:4] # manually selecting a volume with 2 cells
usethis::use_data(oligo, overwrite=TRUE)