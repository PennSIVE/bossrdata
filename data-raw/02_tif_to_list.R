#' converts tif to list and saves it as Rbinary
mouse.tif <- readRDS('results/mouse.tif')
system.time(mouse.list <- purrr::reduce(mouse.tif, abind::abind))
message(sprintf('List size: %s', object.size(mouse.list)))
saveRDS(mouse.list, file='results/mouse.list')