# Notes pour la Soutenance Orale - Calvas & Co

## 1. Introduction
*   **Présentation du sujet** :
    *   **Thème** : "Calvas & Co" - Une agence de voyage humoristique ciblant les personnes chauves ou soucieuses de leurs cheveux.
    *   **Slogan** : "On est là pour mettre fin à votre carrière de lampadaire".
    *   **Pourquoi ce choix ?** : Volonté de traiter un sujet original avec humour pour se démarquer, tout en gardant une structure de site e-commerce/voyage classique.

## 2. Déroulement du travail de groupe
*   **Répartition des tâches** :
    *   **Membre 1** : Chargé de l'architecture globale, du design system (CSS), et du développement de la majorité des pages (Accueil, Voyages, Réservation, Airline, À propos).
    *   **Membre 2** : En charge de l'intégration et du contenu d'une partie spécifique de la page "À propos" (sections de contact/détails).
*   **Outils utilisés** :
    *   VS Code (éditeur de code).
    *   Partage de fichiers (Git).
*   **Difficultés collectives et solutions** :
    *   **Cohérence du design** : Comment s'assurer que toutes les pages se ressemblent ?
        *   *Solution* : Utilisation d'un fichier CSS commun (`styles/styles.css`) et de variables CSS (pour les couleurs, polices).
    *   **Gestion des liens relatifs** : Difficulté de lier les pages entre elles quand elles sont dans des sous-dossiers (`airline/`, `details/`).
        *   *Solution* : Utilisation de `../` pour remonter dans l'arborescence.

## 3. Présentation technique et Démo
**Attention : Expliquer les termes techniques pour les non-initiés.**

*   **Démonstration du site** : Naviguer entre l'accueil, les voyages et la réservation.
*   **Points techniques clés (Réussites)** :
    *   **L'identité visuelle (CSS)** :
        *   *Explication sans jargon* : "Nous avons défini des règles de style (couleurs, polices d'écriture) centralisées pour que, si on change le bleu principal, il change partout." (Référence aux variables CSS).
        *   *Mentionner* : L'utilisation de polices personnalisées (`@font-face`) pour donner une identité unique.
    *   **La mise en page (Flexbox/Grid)** :
        *   *Explication* : "Pour aligner les éléments (comme la barre de navigation ou les cartes de voyage), nous avons utilisé des outils de mise en page modernes qui permettent aux éléments de s'adapter à l'espace disponible."
    *   **Les animations** :
        *   *Explication* : "L'effet d'apparition fluide au chargement (`fadeIn`) rend le site plus dynamique."
    *   **Le formulaire de réservation** :
        *   *Explication* : "La page de réservation permet de choisir son voyage via des menus déroulants (`<select>`). C'est l'élément interactif principal du site."

## 4. Bilans Individuels (Durée : ~1 min par pers.)
*Chaque membre doit préparer ses propres notes ici.*

### Membre 1 :
*   **J'ai réalisé** : L'ensemble de la structure du site, la charte graphique (CSS), les pages Accueil, Voyages, Réservation, et Compagnie Aérienne.
*   **Réussite** : La mise en place d'un système de variables CSS pour faciliter la maintenance et la création d'animations (fadeIn).
*   **Difficulté** : Assurer la cohérence des liens et du design sur l'ensemble des pages et la gestion du volume de travail.
*   **Apport personnel** : Grande progression technique sur la gestion de projet complet et l'autonomie en développement web.

### Membre 2 :
*   **J'ai réalisé** : L'intégration d'une section de la page "À propos" (Contact).
*   **Réussite** : Avoir réussi à s'insérer dans l'architecture de code existante.
*   **Difficulté** : Comprendre le fonctionnement des classes CSS globales créées par le Membre 1 pour les réutiliser sans tout casser.
*   **Apport personnel** : Apprentissage du travail collaboratif et de l'adaptation à du code écrit par quelqu'un d'autre.
