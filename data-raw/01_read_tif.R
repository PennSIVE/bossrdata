#' reads .TIF file and saves it as R binary
mouse.tif <- tiff::readTIFF(here::here('data-raw/mini.tif'), all=TRUE)
message(sprintf('R.Tif size: %s', object.size(mouse.tif)))
saveRDS(mouse.tif, file='results/mouse.tif')