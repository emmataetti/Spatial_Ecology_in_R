# script for modelling the dispersion of population of individuals

# new packages to be installed:
install.packages("terra")
install.packages("sdm")

# check/use the pakages 
library(terra)
library(sdm)



install.packages("terra")
Installazione pacchetto in ‘C:/Users/emmat/AppData/Local/R/win-library/4.6’
(perché ‘lib’ non è specificato)
--- Per piacere, seleziona un mirror CRAN per la sessione ---
si installa anche la dipendenza ‘Rcpp’

apertura URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/Rcpp_1.1.2.zip'
apertura URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/terra_1.9-50.zip'
Avvertimento in download.packages(pkgs, destdir = tmpd, available = available, :
  scaricamento pacchetto ‘terra’ fallito
package ‘Rcpp’ successfully unpacked and MD5 sums checked

I pacchetti binari scaricati sono in
        C:\Users\emmat\AppData\Local\Temp\RtmpAX4GUO\downloaded_packages
Messaggi di avvertimento:
1: In download.file(urls, destfiles, "libcurl", mode = "wb", ...) :
  URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/terra_1.9-50.zip': Timeout di 60 secondi raggiunto
2: In download.file(urls, destfiles, "libcurl", mode = "wb", ...) :
  alcuni file non sono stati scaricati
> library(terra)
Errore in library(terra) : non c'è alcun pacchetto chiamato ‘terra’
> 
> 
> 
> install.packages("sdm")
Installazione pacchetto in ‘C:/Users/emmat/AppData/Local/R/win-library/4.6’
(perché ‘lib’ non è specificato)
si installano anche le dipendenze ‘terra’, ‘sp’, ‘raster’

apertura URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/terra_1.9-50.zip'
apertura URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/sp_2.2-3.zip'
apertura URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/raster_3.6-32.zip'
apertura URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/sdm_1.2-59.zip'
Error in download.file(urls, destfiles, "libcurl", mode = "wb", ...) : 
  non è possibile scaricare alcun file
In aggiunta: Messaggi di avvertimento:
1: In download.file(urls, destfiles, "libcurl", mode = "wb", ...) :
  URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/terra_1.9-50.zip': Timeout di 60 secondi raggiunto
2: In download.file(urls, destfiles, "libcurl", mode = "wb", ...) :
  URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/sp_2.2-3.zip': Timeout di 60 secondi raggiunto
3: In download.file(urls, destfiles, "libcurl", mode = "wb", ...) :
  URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/raster_3.6-32.zip': Timeout di 60 secondi raggiunto
4: In download.file(urls, destfiles, "libcurl", mode = "wb", ...) :
  URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.6/sdm_1.2-59.zip': Timeout di 60 secondi raggiunto
Avvertimento in download.packages(pkgs, destdir = tmpd, available = available, :
  scaricamento pacchetto ‘terra’ fallito
Avvertimento in download.packages(pkgs, destdir = tmpd, available = available, :
  scaricamento pacchetto ‘sp’ fallito
Avvertimento in download.packages(pkgs, destdir = tmpd, available = available, :
  scaricamento pacchetto ‘raster’ fallito
Avvertimento in download.packages(pkgs, destdir = tmpd, available = available, :
  scaricamento pacchetto ‘sdm’ fallito
> 
