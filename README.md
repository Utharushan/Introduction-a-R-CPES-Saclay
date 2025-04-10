# 📊 Introduction à R — Projets & Simulations

Ce dépôt regroupe plusieurs projets réalisés en langage R dans le cadre d’un cours d’introduction à la programmation statistique. Chaque projet aborde un concept ou une application concrète : modélisation écologique, analyse génomique, finances personnelles, démographie, ou encore visualisation de données.

---

## 📁 Structure du dépôt

```
.
├── amortissement/
│   ├── amortissement.R
│   ├── amortissement.csv
│   └── amortissement.png
├── genome/
│   ├── genome.R
│   ├── genome.txt
│   ├── genome.RData
│   └── all_biais.png
├── population/
│   ├── population.R
│   ├── scenario1.png
│   ├── scenario2.png
│   ├── scenario3.png
│   └── scenario4.png
├── proie_predateur/
│   ├── proie_predateur.R
│   └── proie_predateur.png
├── revenus/
│   ├── revenus.R
│   ├── revenus.csv
│   └── revenus.png
└── brouillon.R
```

---

## 🧮 Projets

### 1. 📉 Amortissement d’un prêt (`amortissement/`)
Ce script calcule un tableau d’amortissement pour un prêt personnel et génère un graphique de l’évolution du solde, des intérêts et des mensualités.

- **Entrées** : montant du prêt, taux d’intérêt annuel, durée du prêt
- **Sorties** :
  - `amortissement.csv` : tableau d’amortissement
  - `amortissement.png` : graphique des flux financiers

---

### 2. 🧬 Analyse de génome (`genome/`)
Ce script étudie la composition nucléotidique d’un fichier génomique, calcule le biais GC et produit un graphique de visualisation.

- **Entrées** : `genome.txt` (séquence brute)
- **Sorties** :
  - `genome.RData` : sauvegarde de la séquence analysée
  - `all_biais.png` : graphique du biais GC

---

### 3. 👥 Simulation de population (`population/`)
Modélisation de l’évolution d’une population sur plusieurs années avec prise en compte de la structure d’âge, de la fécondité et des taux de survie.

- **Paramètres** : effectif initial, nombre d’années, taux par tranche d’âge
- **Sorties** : 4 scénarios graphiques (`scenario1.png` à `scenario4.png`)

---

### 4. 🐇🦊 Modèle proie-prédateur (`proie_predateur/`)
Ce script simule l’évolution d’un système proie-prédateur selon un modèle mathématique basé sur des interactions biologiques simples.

- **Modèle utilisé** :
  \[
  \begin{cases}
  X_{n+1} = X_n \cdot S_{proie} - p \cdot X_n \cdot Y_n \\
  Y_{n+1} = Y_n \cdot S_{prédateur} + c \cdot X_n \cdot Y_n
  \end{cases}
  \]

- **Paramètres** :
  - Proies initiales : 200
  - Prédateurs initiaux : 50
  - Survie proies : 1.05
  - Survie prédateurs : 0.97
  - Taux de prédation : 0.001
  - Croissance prédateurs : 0.0002
  - Cycles simulés : 6000

- **Sortie** :
  - `proie_predateur.png` : graphique avec courbes d’évolution

---

### 5. 💰 Analyse de revenus (`revenus/`)
Étude d’un jeu de données sur les revenus à travers des statistiques descriptives et des visualisations.

- **Entrée** : `revenus.csv`
- **Sorties** :
  - Statistiques et visualisations dans `revenus.png`

---

## 🛠️ Prérequis

- **R** (version ≥ 4.0)
- Packages recommandés :
  - `ggplot2`
  - `gridExtra`

---

## ▶️ Exécution

1. Ouvrir un terminal R ou RStudio
2. Aller dans le répertoire du projet
3. Lancer un script avec :

```r
source("nom_du_dossier/nom_du_script.R")
```

> Exemple : `source("proie_predateur/proie_predateur.R")`
