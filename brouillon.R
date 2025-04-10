rm(list = ls())

#-------------------------------------------------------------------------------
# var <- c(1.1, 4.5, 3.23)
# print(var)
# names(var) <- c("largeur", "longueur", "hauteur")
# print(var["longueur"])
# 
# vect1 <- c(1, 2, 34, 5, 6, NA)
# 
# note <- 10
# if (note >= 10.0) {
#   resultat <- "reçu"
# } else {
#   resultat <- "ajourné"
# }
# print(resultat)
# 
# compteur <- c(1:11)
# somme = 0
# for (k in compteur)
# {
#   somme = somme + k
# }
# print(somme)

Especes <- c("Campagnol", "Souris", "Ecureil roux", "Loutre", "Moufette rayée", "Cheval", "Hippopotame", "Phacochère", "Elephant")
Masse <- c(0.025, 0.02, 0.189, 7.2, 2.25, 270, 2390, 87, 4000)
Gestation <- c(20, 25, 35, 60, 42, 336, 230, 175, 630)
Portee <- c(5, 5, 4, 2, 6, 1, 1, 4.8, 1)
Age <- c(0.11, 0.15, 1, 3, 1, 4, 10, 2, 15)
#Ordre <- c("Rongeurs", "Rongeurs", "Rongeurs", "Carnivores", "Carnivores", "Perissodactyles", "Artiodactyles", "Artiodactyles", "Proboscidiens")
#Ordre <- c(rep("Rongeurs", 3), rep("Carnivores", 2), "Perissodactyles", rep("Artiodactyles", 2), "Proboscidiens")
x <- c("Rongeurs", "Carnivores", "Perissodactyles", "Artiodactyles", "Proboscidiens")
times <- c(3, 2, 1, 2, 1)
Ordre <- rep(x, times)

Table <- array(data = c(Ordre, Masse, Gestation, Portee, Age), dim = c(9, 5))
rownames(Table) <- Especes
colnames(Table) <- c("Ordre", "Masse", "Gestation", "Portee", "Age")
Table

#-------------------------------------------------------------------------------

pays <- c("Afrique du Sud", "Allemagne", "Arabie Saoudite", "Argentine", "Australie", "Brésil", "Canada", "Chine", "Corée du Sud", "Etats-Unis", "France", "Inde", "Indonésie", "Italie", "Japon", "Mexique", "Royaume-Uni", "Russie", "Turquie")
pib <- c(380, 4526, 1068, 646, 1728, 2174, 2142, 17790, 1713, 27720, 3052, 3568, 1371, 2301, 4204, 1789, 3381, 2021, 1118)
nbhab <- c(63, 83, 33, 46, 27, 211, 40, 1411, 52, 340, 68, 1438, 281, 59, 125, 130, 68, 144, 85)
Table <- array(data = c(pib, nbhab), dim = c(19, 2))
rownames(Table) <- pays
colnames(Table) <- c("Pib", "Nb Habitants")
pibhab <- pib / nbhab
Table = cbind(Table, pibhab)
colnames(Table) <- c("PIB", "NbHab", "PibHab")
pibhab
Ord_Table = Table[order(Table[, "PibHab"]), ]
Ord_Table
plot(Ord_Table)
