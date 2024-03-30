# EnchantedDiary

***EnchantedDiary*** est votre journal intime numérique. Sauvegardez vos pensées en toute sécurité et explorez vos émotions. Capturer chaque moment magique de votre vie.

Équipe :
- BOUCHENDHOMME Alexis, développeur
- CHOQUET Mathias, *scrum master*
- DELHOUTE Clara
- DESTICOURT Matt, *product owner*

## Table des matières
- [Installation](#installation)
- [Base de données](#base-de-données)
- [Spécificités](#spécificités)
- [Ressources](#ressources)

## Installation
1. Cloner le dépôt :
```bash
git clone https://github.com/iwizy59/enchanteddiary.git
cd enchanteddiary
```
2. Installer les dépendances :
```bash
flutter pub get
```
3. Lancer l'application (de façon usuelle, sur votre support préféré)

## Base de données
Les fonctions qui permettent d'inéragir avec la base de données sont accessibles dans le répertoire `lib/database`. On utilise la librarie *sqflite_common* (2.5.3) pour cela.

## Spécificités

Le projet utilise ***Flutter*** avec différentes librairies.

- **Onboarding :** quand l'utilisateur lance l'application pour la première fois, le principe de l'application lui est présenté, il peut alors renseigner sa question secrète et son code PIN (`lib/onboarding`).
- **Authentification :** la réponse à la question secrète et le code PIN sont sauvegardés en *shared preferences* via la librairie *shared_preferences_web* (2.2.2), l'utilisateur est amené à saisir son code PIN pour s'authentifier à chaque fois qu'il relance l'application, et peut décider de le changer à tout moment dans les paramètres de l'application (`lib/pin`).
- **Accueil :** la page d'accueil de l'application contient le calendrier de la librairie *table_calendar* (3.1.0), il peut cliquer sur les jours afin d'accéder à l'entrée correspondante, une citation choisie aléatoirement parmi une liste définie apparaît en bas de la page (`lib/calendar`).
- **Navigation :** l'application est navigable de façon intuitive grâce à une *navbar* dans le *footer* et au *header*, des icônes clicables permettent d'accéder aux différentes fonctionnalités de l'application (`lib/header/header/dart` et `lib/footer.dart`).
- **Entrées journalières :** quand l'utilisateur clique sur une journée du calendrier, il accède à l'entrée du jour correspondant où il peut y saisir un titre et le contenu de sa note (`lib/add_entry/add_entry.dart`).
- **Mood du jour :** sur cette même page, l'utilisateur peut choisir son *mood* du jour via notre sélecteur d'émotion (*excited*, *happy*, *meh*, *sad*, *frustrated*), la couleur du *header* se met alors à jour avec la couleur associée à l'émotion ; il en est de même pour la couleur de la journée sur le calendrier de la page d'accueil ; la base de données est mise à jour par conséquent. (`lib/emotion/emotion.dart`).
- **Nuage de mots :** depuis la *navbar*, l'utilisateur peut accéder au nuage de mots qui montre par défaut les 10 mots les plus utilisés sur le mois en cours ; il peut modifier ces critères (de 1 à 50 mots, les dates de son choix) et le nuage de mots se met à jour en temps réel. (`lib/cloud`).
- **Recherche :** depuis la *navbar*, l'utilisateur peut accéder à la page de recherche afin d'effectuer une recherche par mots et/ou émotion à travers toutes ses notes. (`lib/search`).
- **Statistiques :**, depuis la page de recherche, l'utilisateur peut choisir d'accéder à divers statistiques à propos de son utilisation de l'application (`lib/statistiques.dart`).
- **Paramètres :** depuis la *navbar*, l'utilisateur peut accéder aux paramètres afin de mettre à jour sa photo grâce à la librairie *image_picker* (0.8.9), son nom d'utilisateur, modifier son code PIN et accéder aux mentions légales de l'application (`lib/settings`).

## Ressources
- **Maquette :** https://www.figma.com/file/d17PziH0MH5Wlcm0dibuKj/EnchantedDiary
- **Sprint retropesctives** : https://metroretro.io/BOUWW3KQME3F + `retro.txt`
- **Support de la présentation :** accessible dans le fichier `presentation.pdf`
- **Trello** : https://trello.com/b/ICz0OOA3/enchanteddiary