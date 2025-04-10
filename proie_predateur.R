rm(list = ls())

survie_proie = 1.05
survie_predateur = 0.97
taux_de_predation = 0.001
croissance_predateur = 0.0002
nombre_de_cycle = 6000

evolution_proie = rep(0, 6000)
evolution_predateur = rep(0, 6000)

evolution_proie[1] = 200
evolution_predateur[1] = 50

for (i in 2:6000) {
  evolution_proie[i] = evolution_proie[i - 1] * survie_proie -
    taux_de_predation * evolution_proie[i - 1] * evolution_predateur[i - 1]
  evolution_predateur[i] = evolution_predateur[i - 1] * survie_predateur +
    croissance_predateur * evolution_proie[i - 1] * evolution_predateur[i - 1]
}

evolution_predateur
evolution_proie

graphe <- plot(evolution_proie, type = "l", col = "blue", xlab = "Années", ylab = "Effectif", main = "Proie et prédateur")
lines(evolution_predateur, col = "red")
legend("topright", legend = c("Proie", "Prédateur"), col = c("blue", "red"), lty = 1)
