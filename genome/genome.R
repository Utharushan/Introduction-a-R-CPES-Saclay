# Vider l'espace de travail
rm(list = ls())

# Charger le génome
genome <- readLines("genome.txt")
save(genome, file = "genome.RData")
load("genome.RData")

# La liste des caractères
nuclist <- c("A", "C", "G", "T")

# Reconstruction du génome sous forme de chaîne unique
genome_seq <- paste(genome, collapse = "")

# Paramètres
frag_taille <- 100000  # Taille des fragments
nb_frag <- floor(nchar(genome_seq) / frag_taille)  # Nombre de fragments

# Initialisation des vecteurs pour stocker les résultats
biais <- numeric(nb_frag)
biais_cumul <- numeric(nb_frag)

# Boucle pour calculer le biais GC sur chaque fragment
pos_debut <- 1
pos_fin <- frag_taille

for (i in 1:nb_frag) {
  # Extraire le fragment
  frag <- substr(genome_seq, pos_debut, pos_fin)
  fragvec <- strsplit(frag, split = "")[[1]]
  
  # Création du compteur de nucléotides
  nuc_compo <- setNames(rep(0, length(nuclist)), nuclist)
  
  # Comptage des nucléotides
  for (j in seq_along(fragvec)) {
    if (fragvec[j] %in% nuclist) {
      nuc_compo[fragvec[j]] <- nuc_compo[fragvec[j]] + 1
    }
  }
  
  # Calcul du biais GC
  if ((nuc_compo["G"] + nuc_compo["C"]) > 0) {
    biais[i] <- (nuc_compo["G"] - nuc_compo["C"]) / (nuc_compo["G"] + nuc_compo["C"])
  } else {
    biais[i] <- NA  # Éviter une division par zéro
  }
  
  # Calcul du biais cumulé
  biais_cumul[i] <- ifelse(i == 1, biais[i], biais_cumul[i - 1] + biais[i])
  
  # Mise à jour des positions
  pos_debut <- pos_fin + 1
  pos_fin <- pos_debut + frag_taille - 1
}

# Détermination des points min et max du biais cumulé
fragmin <- which.min(biais_cumul)
fragmax <- which.max(biais_cumul)

# Création de l'axe des abscisses
x <- seq(1, nb_frag, by = 1)

# Génération des graphiques
png("all_biais.png", width = 1400, height = 800)
par(mfrow = c(1, 2))

# Graphique du biais GC
plot(x, biais, type = "l", col = "blue", xlab = "N° du fragment", ylab = "Biais GC",
     main = "Évolution du biais de GC le long du chromosome de E. coli")
abline(h = 0, lty = 2)
abline(v = fragmin, lty = 2, col = "red")
abline(v = fragmax, lty = 2, col = "red")
text(x = fragmax, y = 0, labels = fragmax, pos = 1, col = "red")
text(x = fragmin, y = 0, labels = fragmin, pos = 1, col = "red")

# Graphique du biais cumulé
plot(x, biais_cumul, type = "l", col = "blue", xlab = "N° du fragment", ylab = "Biais cumulé de GC",
     main = "Évolution du biais cumulé le long du chromosome de E. coli")
abline(h = 0, lty = 2)
abline(v = fragmin, lty = 2, col = "red")
abline(v = fragmax, lty = 2, col = "red")
text(x = fragmax, y = 0, labels = fragmax, pos = 1, col = "red")
text(x = fragmin, y = 0, labels = fragmin, pos = 1, col = "red")

dev.off()