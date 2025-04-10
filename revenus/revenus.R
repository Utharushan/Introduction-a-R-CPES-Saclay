rm(list = ls())

library(ggplot2)

data <- read.csv("revenus.csv")
data

age_revenu <- data.frame(
  age = data$age,
  revenu = data$revenu
)

scatterplot <- ggplot(data = age_revenu, aes(x = age, y = revenu)) +
  labs(title = "Revenu en fonction de l'âge",
       x = "Âge",
       y = "Revenu") +
  theme_minimal() +
  geom_point()

scatterplot

moyenne_homme_actif <- data$revenu[data$sexe == "homme"][data$age[data$sexe == "homme"] <= 45]
moyenne_femme_actif <- data$revenu[data$sexe == "femme"][data$age[data$sexe == "femme"] <= 45]

moyenne_homme_actif
moyenne_femme_actif

t.test(
  data$revenu[data$sexe == "homme"][data$age[data$sexe == "homme"] <= 45],
  data$revenu[data$sexe == "femme"][data$age[data$sexe == "femme"] <= 45]
)

ev <- ggplot(data = data, aes(x = age, y = revenu)) +
  labs(title = "Revenu en fonction de l'âge",
       x = "Âge",
       y = "Revenu") +
  theme_minimal() +
  geom_point(aes(color = sexe)) +
  geom_smooth(method = "lm")

png("revenus.png", width = 800, height = 600)
ev
dev.off()