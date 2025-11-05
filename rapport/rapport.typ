#import "template/modele.typ": iut-orsay-report

#show: iut-orsay-report.with(
  student-name: [Tiphaine Patraque], // A mettre à jour avec votre nom/prénom,
  group: [TP1W], // Remplacer par votre groupe
  title: [Rapport du projet S104 - CréaBD],
  subtitle: [Partie 1],
  keywords: ("MCD", "dictionnaire", "données"),
  diploma: [BUT Informatique],
  level: [Première année],
  specialty: none,
  company-name: [Cercle des Sorcières de Lancre] // A mettre à jour avec le nom de l'organisation (entreprise, club, administration, ...) étudiée
)

// On démarre une nouvelle section avec =, une sous-section avec ==, et ainsi de suite pour les niveaux suivants
= Présentation de l'organisation<presentation>

#lorem(250)

= Modèle Conceptuel des Données<mcd>

Mettre ici votre image faite avec Looping. Cf #ref(<annexe2>, form: "page")

= Dictionnaire des données<dd>

#table(
  columns: (auto, auto, 1fr),
  align: (left + horizon, center + horizon, left + top),
  table.header[#align(center)[*NOM RUBRIQUE*]][#align(center)[*TYPE*]][#align(center)[*DESCRIPTIF*]],
  [IdSorcière], [A], [Numéro identifiant la sorcière],
  [NomSorcière], [A], [Nom de la sorcière],
  [etc.], [etc.], [etc.],
)

/* Décommenter si vous avez des contraintes non modélisables
= Contraintes non modélisables<cnm>

#lorem(50)
*/

= Annexes<annexes>

== Annexe 1 : Interview avec Eskarina Lefèvre<annexe1>

#lorem(1000)

== Annexe 2 : capture d'écran du logiciel Witchy Workshop<annexe2>

#align(center)[
  
]

== Annexe 3 : autre annexe<annexe3>

== Annexe 4 : autre annexe<annexe4>