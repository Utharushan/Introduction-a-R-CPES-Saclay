rm (list = ls())

# Scénario 1
nbCompartiments <- 5
nbAnnees <- 75
effectif_compartiment <- c(50, 0, 0, 0, 0)
taux_de_fecondite <- 3.75
taux_de_transition <- c(0.75, 0.6, 0.6, 0.5, 0.4937)

# # Scénario 2
# nbCompartiments <- 5
# nbAnnees <- 30
# effectif_compartiment <- c(50, 0, 0, 0, 0)
# taux_de_fecondite <- 5
# taux_de_transition <- c(0.75, 0.6, 0.6, 0.5, 0.4937)
# 
# # Scénario 3
# nbCompartiments <- 5
# nbAnnees <- 100
# effectif_compartiment <- c(50, 10, 10, 10, 10)
# taux_de_fecondite <- 3.25
# taux_de_transition <- c(0.75, 0.6, 0.6, 0.5, 0.4937)
# 
# # Scénario 4
# nbCompartiments <- 6
# nbAnnees <- 200
# effectif_compartiment <- c(0, 0, 0, 0, 0, 100)
# taux_de_fecondite <- 4.65
# taux_de_transition <- c(0.72, 0.72, 0.72, 0.72, 0.72, 0.1)

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
