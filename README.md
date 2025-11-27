# Atlas Géographique

Petite application Flutter d'examen pratique qui présente une liste de pays et des pages de navigation : écran d'accueil (welcome), liste des pays, détails d'un pays, et une page À propos.

## Contenu principal

- `lib/main.dart` : point d'entrée de l'application (démarre sur `WelcomePage`).
- `lib/welcome_page.dart` : écran d'accueil avec AppBar "Atlas Géographique", image de bienvenue (`assets/globe.png`) et bouton "Explorer" qui ouvre la liste des pays.
- `lib/countries_page.dart` : liste des pays avec AppBar "Liste des Pays", Drawer (Accueil / À propos / Quitter) et `ListView` de pays.
- `lib/country_detail_page.dart` : page de détail d'un pays (AppBar avec bouton retour + nom du pays, grand drapeau, capitale, population, superficie, langue officielle).
- `lib/about_page.dart` : page À propos (placeholder).
- `lib/home_page.dart` : placeholder HomePage (si nécessaire).
- `lib/models/country.dart` : modèle de données `Country` avec les attributs : `name`, `capital`, `population`, `area`, `languages`, `flag`.

## Structure des assets

Le projet utilise des assets locaux :

- `assets/globe.png` — image d'accueil
- `assets/flags/...` — images de drapeaux (optionnel : emojis sont aussi utilisés comme fallback)

Assurez-vous d'avoir déclaré les assets dans `pubspec.yaml` sous la section `flutter:` correctement, par exemple :

```yaml
flutter:
  assets:
    - assets/globe.png
    - assets/flags/
```

Notes importantes sur les erreurs d'asset (ex : "Unable to load asset: \"assets/flags/brazil-flag-png-large.png\"")

1. Vérifiez que les fichiers existent réellement au chemin indiqué dans le repo (respect exact des noms et des extensions).
2. Vérifiez l'indentation et l'emplacement de la section `assets:` dans `pubspec.yaml`. Elle doit être indentée sous `flutter:` (2 espaces) — une erreur typique provoque l'asset non trouvé.
3. Après modification de `pubspec.yaml`, exécutez :

```bash
flutter pub get
```

4. Si l'app tournait déjà, faites un "full restart" (hot restart peut ne pas suffire pour charger de nouveaux assets).

5. Exemple d'entrée incorrecte vs correcte :

Incorrect (fausse indentation) :

```yaml
flutter:
assets:
- assets/globe.png
```

Correct :

```yaml
flutter:
  assets:
    - assets/globe.png
```

## Comment exécuter

Ouvrez un terminal à la racine du projet (`atlas_geo_osama`) puis :

```bash
flutter pub get
flutter run
```

Sur un émulateur ou appareil connecté, `flutter run` lance l'application. Si vous voyez des erreurs de ressources d'image, suivez la checklist ci-dessus.

## Navigation et comportement

- Sur l'écran d'accueil (`WelcomePage`), le bouton "Explorer" ouvre `CountriesPage`.
- Sur `CountriesPage`, le Drawer -->
  - "Accueil" : retourne à `WelcomePage` (pushAndRemoveUntil).
  - "À propos" : ouvre `AboutPage`.
  - "Quitter" : affiche un dialogue et ferme l'app avec `SystemNavigator.pop()` si confirmé.
- Cliquer un pays dans la liste ouvre `CountryDetailPage` qui affiche les informations détaillées du pays.

## Modèle de données `Country`

Le modèle se trouve dans `lib/models/country.dart` et ressemble à :

```dart
class Country {
  final String name;
  final String capital;
  final int population; // en nombre d'habitants
  final int area; // en km2
  final String languages;
  final String flag; // emoji ou chemin d'asset

  const Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.area,
    required this.languages,
    required this.flag,
  });
}
```

## Format d'affichage

- Population : affichée en millions d'habitants (`XX millions d'habitants`).
- Superficie : affichée en `XX km2`.

## Dépannage rapide

- "Unable to load asset" : voir section "Structure des assets". Vérifiez l'orthographe, l'indentation dans `pubspec.yaml` et exécutez `flutter pub get`.
- Si vous utilisez des assets volumineux pour les drapeaux, vérifiez qu'ils sont bien ajoutés et que les noms ne contiennent pas d'espaces ou de caractères spéciaux.

---

Si vous voulez, je peux :

1. Vérifier et appliquer automatiquement l'entrée `assets:` dans votre `pubspec.yaml` (je peux l'éditer ici).  
2. Ajouter un petit ensemble de drapeaux dans `assets/flags/` et mettre à jour `pubspec.yaml`.  

Indiquez ce que vous préférez et je m'en occupe.