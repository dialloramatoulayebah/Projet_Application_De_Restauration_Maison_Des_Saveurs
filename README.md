# Projet Programmation : Application de Restauration "Maison des Saveurs"

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/) [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/) [![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)](https://www.mongodb.com/) [![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

Bienvenue dans le projet **Maison des Saveurs**, une application mobile de commande de repas inspirée des saveurs africaines et internationales. Cette application a été développée avec **Flutter** pour le frontend et **Flask** pour le backend, utilisant une base de données **MongoDB**, et elle inclut un **chat bot (chat box)** interactif permettant aux utilisateurs de poser des questions sur les plats et d’ajouter des articles au panier directement depuis la conversation.

## 📱 Présentation de l'application
L'application permet aux utilisateurs de :
* Explorer différents plats, boissons et salades.
* Ajouter des articles au panier avec un compteur visible en haut à droite.
* Visualiser et gérer leur panier (modifier les quantités ou supprimer des articles).
* Simuler un paiement via carte de crédit/débit ou via Pay/Google Pay.
* Interagir avec un chat bot / chat box léger pour poser des questions sur les plats disponibles.
* Accéder à des liens sociaux pour suivre la Maison des Saveurs.

## 🎨 Frontend
Le frontend a été développé avec **Flutter**.

**Pages principales :**
* **Accueil (accueil.dart)** : page de bienvenue avec logo, slogan, bouton pour accéder au menu et chat bot interactif.
* **Menu (menuPage.dart)** : affiche les plats par catégorie (salades, repas, boissons) avec un effet de zoom au survol.
* **Détails du produit (details_produit.dart)** : informations détaillées sur chaque plat.
* **Panier (page_panier.dart)** : gestion du panier avec calcul du total et bouton de paiement.
* **Paiement (payment_page.dart)** : formulaire de paiement simulé avec options carte ou Pay/Google Pay.

**Fonctionnalités interactives :**
* **Chat bot / chat box** : permet aux utilisateurs de poser des questions sur les plats et d’ajouter directement des articles au panier.
* **Effets visuels** : zoom sur les cartes de menu au survol, animations lors de l'ajout au panier.

## ⚙️ Backend
Le backend est construit avec **Flask** et utilise **MongoDB** comme base de données pour stocker les informations sur les plats. Il fournit les fonctionnalités suivantes :
* Fourniture des données de menu depuis la base de données MongoDB.
* Gestion des catégories de plats et des informations détaillées pour chaque produit.
* API pour la récupération du menu utilisée par le frontend Flutter.

**Endpoints principaux :**
* `GET /menu` : renvoie la liste complète des plats avec titre, description, prix et image.
* `GET /categories` : renvoie la liste complète des categories avec nom

*(À personnaliser selon votre configuration backend)*

## 🚀 Installation et utilisation
1. Cloner le dépôt :  
   ```bash
   git clone https://github.com/dialloramatoulayebah/Projet_Application_De_Restauration_Maison_Des_Saveurs.git
   cd Projet_Application_De_Restauration_Maison_Des_Saveurs
2. Lancer le backend Flask :  
   ```bash
   python app.py  
   Le backend sera accessible sur http://127.0.0.1:5000/
   
3. Lancer le frontend :  
   ```bash
   flutter pub get  
   flutter run
   Le frontend sera accessible sur le localhost avec un port que flutter assignera automatiquement.
   L’application s’ouvrira sur l’émulateur ou l’appareil connecté.

## 🛠️ Technologies utilisées
* Flutter pour le frontend
* Python / Flask pour le backend
* MongoDB comme base de données
* Chat bot / chat box pour l’interaction utilisateur
* Animations et effets visuels pour améliorer l’expérience utilisateur

## 👥 Auteurs
* Ramatoulaye Diallo
* Justin Sandy
* Ajaoud Hocine
