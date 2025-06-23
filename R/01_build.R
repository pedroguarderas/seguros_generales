# Carga de librerías necesarias --------------------------------------------------------------------
# suppressPackageStartupMessages( library( AER ) )
suppressPackageStartupMessages( library( actuar ) )
# suppressPackageStartupMessages( library( bookdown ) )
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
suppressPackageStartupMessages( library( quarto ) )
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
file.copy( '~/Development/bibliography/Bibtex/bibliografia_libros.bib', 'book/bib/biblibros.bib', overwrite = TRUE )
file.copy( '~/Development/bibliography/Bibtex/bibliografia_paquetes.bib', 'book/bib/bibpaquetes.bib', overwrite = TRUE )
file.copy( '~/Development/bibliography/Bibtex/bibliografia_articulos.bib', 'book/bib/bibarticulos.bib', overwrite = TRUE )

# Genera libro ------------------------------------------------------------------------------------- 
wd <- paste0( getActiveProject(), '/' )
setwd( paste0( wd, 'book' ) )

quarto_render( 
  cache = TRUE,
  cache_refresh = TRUE,
  quiet = FALSE )

setwd( wd )
gc()
