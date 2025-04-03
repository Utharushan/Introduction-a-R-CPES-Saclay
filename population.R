rm (list = ls())

#nombre de compartiments = 5
#nombres d'années = 75
#effectif initial de chaque = c(50, 0, 0, 0, 0)
#Taux de fécondité = 3.75
#Taux de survie de chaque compartiment = c(0.75, 0.6, 0.6, 0.5, 0.4937)

#nombre de compartiments = 5
#nombres d'années = 30
#effectif initial de chaque = c(50, 0, 0, 0, 0)
#Taux de fécondité = 5
#Taux de survie de chaque compartiment = c(0.75, 0.6, 0.6, 0.5, 0.4937)

#nombre de compartiments = 5
#nombres d'années = 100
#effectif initial de chaque = c(50, 10, 10, 10, 10)
#Taux de fécondité = 3.25
#Taux de survie de chaque compartiment = c(0.75, 0.6, 0.6, 0.5, 0.4937)

#nombre de compartiments = 6
#nombres d'années = 200
#effectif initial de chaque = c(0, 0, 0, 0, 0, 100)
#Taux de fécondité = 4.65
#Taux de survie de chaque compartiment = c(0.72, 0.72, 0.72, 0.72, 0.72, 0.1)

nbCompartiments <- 5
nbAnnees <- 75

effectif_compartiment <- c(50, 0, 0, 0, 0)
taux_de_fecondite <- 3.75
taux_de_transition <- c(0.75, 0.6, 0.6, 0.5, 0.4937)
evolution <- c(effectif_compartiment)

for (i in 1:nbAnnees) {
  temp_compartiment <- effectif_compartiment
  for (j in 1:nbCompartiments) {
    if (j == 1) {
      temp_compartiment[j] <- effectif_compartiment[nbCompartiments] * taux_de_fecondite
    } else if (j == nbCompartiments) {
      temp_compartiment[j] <- effectif_compartiment[j] * taux_de_transition[j] + effectif_compartiment[j-1] * taux_de_transition[j-1]
    } else {
      temp_compartiment[j] <- effectif_compartiment[j-1] * taux_de_transition[j-1]
    }
  }
  effectif_compartiment <- temp_compartiment
  evolution <- rbind(evolution, effectif_compartiment)
}

print(effectif_compartiment)
print(evolution)

population <- c()
for (i in 1:nbAnnees) {
  population <- append(population, sum(evolution[i,]))
}
print(population)

plot(population, type = "l", col = "blue", lwd = 2, 
     xlab = "Time (Years)", ylab = "Population", 
     main = "Population Dynamics Over Time")

grid()
