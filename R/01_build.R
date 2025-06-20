# Carga de librerías necesarias --------------------------------------------------------------------
# suppressPackageStartupMessages( library( AER ) )
suppressPackageStartupMessages( library( actuar ) )
suppressPackageStartupMessages( library( bookdown ) )
# suppressPackageStartupMessages( library( boot ) )
# suppressPackageStartupMessages( library( conflicted ) )
suppressPackageStartupMessages( library( broom ) )
# suppressPackageStartupMessages( library( caret ) )
suppressPackageStartupMessages( library( ChainLadder ) )
suppressPackageStartupMessages( library( compiler ) )
suppressPackageStartupMessages( library( data.table ) )
suppressPackageStartupMessages( library( demography ) )
suppressPackageStartupMessages( library( devtools ) )
# suppressPackageStartupMessages( library( dbplyr ) )
# suppressPackageStartupMessages( library( dtplyr ) )
suppressPackageStartupMessages( library( fExtremes ) )
suppressPackageStartupMessages( library( fitdistrplus ) )
# suppressPackageStartupMessages( library( forcats ) )
suppressPackageStartupMessages( library( forecast ) )
suppressPackageStartupMessages( library( ggplot2 ) )
# suppressPackageStartupMessages( library( glmnet ) )
suppressPackageStartupMessages( library( googledrive ) )
# suppressPackageStartupMessages( library( googlesheets4 ) )
# suppressPackageStartupMessages( library( haven ) )
# suppressPackageStartupMessages( library( ids ) )
suppressPackageStartupMessages( library( kableExtra ) )
suppressPackageStartupMessages( library( knitr ) )
suppressPackageStartupMessages( library( latex2exp ) )
suppressPackageStartupMessages( library( lifecontingencies ) )
# suppressPackageStartupMessages( library( locfit ) )
suppressPackageStartupMessages( library( lubridate ) )
# suppressPackageStartupMessages( library( mgcv ) )
suppressPackageStartupMessages( library( nloptr ) )
suppressPackageStartupMessages( library( openxlsx ) )
# suppressPackageStartupMessages( library( pscl ) )
# suppressPackageStartupMessages( library( quarto ) )
# suppressPackageStartupMessages( library( rainbow ) )
# suppressPackageStartupMessages( library( ranger ) )
suppressPackageStartupMessages( library( RColorBrewer ) )
suppressPackageStartupMessages( library( readxl ) )
# suppressPackageStartupMessages( library( rematch2 ) )
# suppressPackageStartupMessages( library( reprex ) )
suppressPackageStartupMessages( library( rmarkdown ) )
suppressPackageStartupMessages( library( rstudioapi ) )
suppressPackageStartupMessages( library( scales ) )
suppressPackageStartupMessages( library( sf ) )
suppressPackageStartupMessages( library( shiny ) )
suppressPackageStartupMessages( library( showtext ) )
# suppressPackageStartupMessages( library( sp ) )
suppressPackageStartupMessages( library( splines ) )
suppressPackageStartupMessages( library( sysfonts ) )
# suppressPackageStartupMessages( library( tidyr ) )
suppressPackageStartupMessages( library( wesanderson ) )
suppressPackageStartupMessages( library( xts ) )
suppressPackageStartupMessages( library( zoo ) )


if ( !require( 'CASdatasets' ) ) {
  
  devtools::install_github("dutangc/CASdatasets", dependencies = TRUE, upgrade = 'always' )
  
} else {
  
  suppressPackageStartupMessages( library( CASdatasets ) )
  
}

options( scipen = 999 )
options( stringsAsFactors = FALSE )
options( datatable.optimize = 1L )

# Parámetros ---------------------------------------------------------------------------------------
wd <- paste0( getActiveProject(), '/' )
setwd( wd )

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
file.copy( '~/Development/bibliography/Bibtex/bibliografia_libros.bib', 'bookdown/bib/biblibros.bib', overwrite = TRUE )
file.copy( '~/Development/bibliography/Bibtex/bibliografia_paquetes.bib', 'bookdown/bib/bibpaquetes.bib', overwrite = TRUE )
file.copy( '~/Development/bibliography/Bibtex/bibliografia_articulos.bib', 'bookdown/bib/bibarticulos.bib', overwrite = TRUE )

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

# Genera libro ------------------------------------------------------------------------------------- 
setwd( wd )
setwd( 'bookdown' )
outdir <- paste0( wd, 'docs' )
# render_book( input = "lectura_01.Rmd", output_format = "bookdown::gitbook", output_dir = outdir,
#              encoding = "UTF-8", config_file = "_bookdown.yml" )

# render_book( input = "lectura_01.Rmd", output_format = "bookdown::pdf_book", output_dir = outdir,
#              encoding = "UTF-8", config_file = "_bookdown.yml" )

render_book( input = "lectura_01.Rmd", output_format = "all", output_dir = outdir,
             encoding = "UTF-8", config_file = "_bookdown.yml", clean = FALSE )

wd <- paste0( getActiveProject(), '/' )
setwd( wd )
gc()
