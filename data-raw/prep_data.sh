cd $(dirname $0)/..

mkdir -p results/ logs/

bsub -J 01_prep_data -o logs/prep_data.log -e logs/prep_data.log -R "rusage[mem=100000]" Rscript data-raw/01_read_tif.R

bsub -J 02_prep_data -w 01_prep_data -ti -o logs/prep_data.log -e logs/prep_data.log -R "rusage[mem=100000]" Rscript data-raw/02_tif_to_list.R

bsub -J 03_prep_data -w 02_prep_data -ti -o logs/prep_data.log -e logs/prep_data.log -R "rusage[mem=100000]" Rscript data-raw/03_list_to_array.R
