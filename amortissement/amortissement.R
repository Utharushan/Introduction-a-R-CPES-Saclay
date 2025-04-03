rm(list = ls())

montant_pret <- 300000
taux_interet <- 3.5
duree_pret <- 20

tableau_amortissement <- function(montant_pret, taux_interet, duree_pret) {
  # Calculer le montant de la mensualité
  mensualite <- (montant_pret * (taux_interet / 1200)) / (1 - (1 + taux_interet / 1200)^(-duree_pret * 12))
  
  # Initialiser le tableau d'amortissement
  tableau <- data.frame(
    Mois = integer(),
    Mensualite = numeric(),
    Interet = numeric(),
    Principal = numeric(),
    Solde = numeric()
  )
  
  solde <- montant_pret
  
  for (mois in 1:(duree_pret * 12)) {
    interet <- solde * (taux_interet / 1200)
    principal <- mensualite - interet
    solde <- solde - principal
    
    # Ajouter une ligne au tableau
    tableau <- rbind(tableau, data.frame(
      Mois = mois,
      Mensualite = round(mensualite, 2),
      Interet = round(interet, 2),
      Principal = round(principal, 2),
      Solde = round(solde, 2)
    ))
  }
  
  return(tableau)
}

tableau_amortissement <- tableau_amortissement(montant_pret, taux_interet, duree_pret)
tableau_amortissement

write.csv(tableau_amortissement, "amortissement.csv")

# Visualisation du tableau d'amortissement
library(ggplot2)
library(gridExtra)

graphe_amortissement <- ggplot(data = tableau_amortissement, aes(x = Mois)) +
  geom_line(aes(y = Mensualite, color = "Mensualité")) +
  geom_line(aes(y = Interet, color = "Intérêt")) +
  geom_line(aes(y = Principal, color = "Principal")) +
  labs(title = "Tableau d'Amortissement",
       x = "Mois",
       y = "Montant") +
  scale_color_manual(values = c("Mensualité" = "blue", "Intérêt" = "red", "Principal" = "green")) +
  theme_minimal()

cumulated_interest <- cumsum(tableau_amortissement$Interet)

graphe_solde <- ggplot(data = tableau_amortissement, aes(x = Mois)) +
  geom_line(aes(y = Solde, color = "Solde")) +
  geom_line(aes(y = cumulated_interest, color = "Intérêt cumulatif")) +
  labs(title = "Solde du Prêt et Intérêt Cumulatif",
       x = "Mois",
       y = "Montant") +
  scale_color_manual(values = c("Solde" = "blue", "Intérêt cumulatif" = "red")) +
  theme_minimal()

graphe_amortissement
graphe_solde

png("amortissement.png", width = 1400, height = 800)
grid.arrange(graphe_amortissement, graphe_solde, ncol = 2)

dev.off()