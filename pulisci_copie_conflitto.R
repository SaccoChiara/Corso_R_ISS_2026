# ================================================================
# TOGLIE DAL SITO LE COPIE "DI CONFLITTO" CREATE DA ONEDRIVE
# ================================================================
#
# Viene eseguito in automatico da Quarto dopo ogni render del sito
# (vedi "post-render" in _quarto.yml): non serve lanciarlo a mano.
#
# La cartella del corso e' sincronizzata con SharePoint. Quando due
# programmi scrivono lo stesso file nello stesso momento, OneDrive ne
# crea una copia con il nome del computer, per esempio
# "index-DESKTOP-7A39U5C.html". Queste copie non devono finire online.
# ================================================================

computer <- Sys.info()[["nodename"]]

copie <- list.files("_site", pattern = paste0("-", computer),
                    recursive = TRUE, full.names = TRUE, all.files = TRUE)

if (length(copie) > 0) {
  file.remove(copie)
  message("Tolte dal sito ", length(copie), " copie di conflitto di OneDrive")
}
