# Carga de librerías necesarias --------------------------------------------------------------------
suppressPackageStartupMessages( library( actuar ) )
suppressPackageStartupMessages( library( bookdown ) )
suppressPackageStartupMessages( library( compiler ) )
suppressPackageStartupMessages( library( data.table ) )
suppressPackageStartupMessages( library( devtools ) )
suppressPackageStartupMessages( library( ggplot2 ) )
suppressPackageStartupMessages( library( googledrive ) )
suppressPackageStartupMessages( library( kableExtra ) )
suppressPackageStartupMessages( library( knitr ) )
suppressPackageStartupMessages( library( latex2exp ) )
suppressPackageStartupMessages( library( lifecontingencies ) )
suppressPackageStartupMessages( library( lubridate ) )
suppressPackageStartupMessages( library( openxlsx ) )
suppressPackageStartupMessages( library( readxl ) )
suppressPackageStartupMessages( library( rmarkdown ) )
suppressPackageStartupMessages( library( rstudioapi ) )
suppressPackageStartupMessages( library( shiny ) )
suppressPackageStartupMessages( library( showtext ) )
suppressPackageStartupMessages( library( sysfonts ) )

if ( !require( 'CASdatasets' ) ) {
  
  devtools::install_github("dutangc/CASdatasets")  
  
} else {
  
  suppressPackageStartupMessages( library( CASdatasets ) )
  
}

options( scipen = 999 )
options( stringsAsFactors = FALSE )

# Parámetros ---------------------------------------------------------------------------------------
wd <- getActiveProject()

# Creando directorios ------------------------------------------------------------------------------
dirs <- c( 'Data', 'RData', 'LaTeX' )
dirs <- c( 'Data', 'RData', 'LaTeX' )
for ( dr in dirs ) {
  if ( !dir.exists( dr ) ) {
    dir.create( dr )
  }
}
rm( dr, dirs )

# Copiando bibliografía ----------------------------------------------------------------------------
file.copy( '~/Development/bibliography/Bibtex/bibliografia_libros.bib', 'bookdown/bibliografia_libros.bib', overwrite = TRUE )
file.copy( '~/Development/bibliography/Bibtex/bibliografia_paquetes.bib', 'bookdown/bibliografia_paquetes.bib', overwrite = TRUE )

# Descarga datos e información ---------------------------------------------------------------------
# Descarga información si en caso está presente en la fuente de origen en Google Drive
# fl <- 'RData/IESS_life_tables_2020.RData'
# if ( !file.exists( fl ) ) {
#   
#   file_src <- as_id( 'https://drive.google.com/file/d/17E273IkxW_C4Y9Q7JqtqiDIiHnsEIXO3/view?usp=drive_link' )
#   drive_deauth()
#   drive_user()
#   drive_download( file = file_src, path = fl, type = 'RData', overwrite = TRUE )
#   
# }
# 
# fl <- 'RData/INEC_cens_pob_aggregated.RData'
# if ( !file.exists( fl ) ) {
#   
#   file_src <- as_id( 'https://drive.google.com/file/d/1VBDoz8n9MszL1BDIqbLKrlS7HRTlNuGo/view?usp=drive_link' )
#   drive_deauth()
#   drive_user()
#   drive_download( file = file_src, path = fl, type = 'RData', overwrite = TRUE )
#   
# }

# Genera libro ------------------------------------------------------------------------------------- 
setwd( wd )
setwd( 'bookdown' )
outdir <- paste0( wd, 'docs' )
render_book( input = "index.Rmd", output_format = "bookdown::gitbook", output_dir = outdir,
             encoding = "UTF-8", config_file = "_bookdown.yml" )

# render_book( input = "index.Rmd", output_format = "bookdown::pdf_book", output_dir = outdir,
#              encoding = "UTF-8", config_file = "_bookdown.yml" )
setwd( wd )
gc()
