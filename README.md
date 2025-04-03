# Introduction à R

Ce dépôt contient plusieurs scripts R illustrant des concepts fondamentaux du langage R à travers différents projets.

## Contenu du dépôt

### 1. Amortissement d'un prêt (`amortissement.R`)
Ce script calcule un tableau d'amortissement pour un prêt donné et génère des graphiques illustrant l'évolution du solde, des intérêts et des mensualités.

- Entrées :
  - Montant du prêt
  - Taux d'intérêt annuel
  - Durée du prêt en années
- Sorties :
  - Un fichier CSV `amortissement.csv` contenant le tableau d'amortissement
  - Un graphique `amortissement.png` montrant l'évolution du prêt

### 2. Analyse de la composition d'un génome (`genome.R`)
Ce script analyse la composition nucléotidique d'un génome en calculant le biais de GC et en générant des graphiques de distribution.

- Entrées :
  - Un fichier `genome.txt` contenant la séquence génomique
- Sorties :
  - Un fichier `genome.RData` sauvegardant la séquence traitée
  - Un graphique `all_biais.png` montrant le biais GC

### 3. Simulation de croissance de population (`population.R`)
Ce script modélise la dynamique de croissance d'une population avec différents taux de fécondité et de survie.

- Paramètres modifiables :
  - Nombre de compartiments d'âge
  - Nombre d'années simulées
  - Effectif initial
  - Taux de fécondité et taux de survie par tranche d'âge
- Sorties :
  - Un graphique montrant l'évolution de la population au cours du temps

### 4. Analyse des revenus (`revenus.R` et `revenus.csv`)
Ce script analyse un jeu de données `revenus.csv` et produit des statistiques descriptives ainsi que des visualisations des répartitions de revenus.

## Prérequis
- R (version 4.0 ou supérieure)
- Packages : `ggplot2`, `gridExtra`

## Exécution des scripts
1. Ouvrir un terminal R ou RStudio
2. Charger un script avec `source("nom_du_script.R")`
