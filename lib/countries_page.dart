import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'welcome_page.dart';
import 'about_page.dart';
import 'models/country.dart';
import 'country_detail_page.dart';

final List<Country> _sampleCountries = [
  const Country(
    name: 'France',
    capital: 'Paris',
    population: 67,
    area: 643801,
    languages: 'Français',
    flag: 'https://www.countryflags.com/wp-content/uploads/france-flag-png-large.png',
  ),
  const Country(
    name: 'Tunisie',
    capital: 'Tunis',
    population: 12,
    area: 163610,
    languages: 'Arabe',
    flag: 'assets/flags/Tunisia_Big.png',
  ),
  const Country(
    name: 'Brésil',
    capital: 'Brasília',
    population: 215,
    area: 8515767,
    languages: 'Portugais',
    flag: 'https://www.countryflags.com/wp-content/uploads/brazil-flag-png-large.png',
  ),
  const Country(
    name: 'Italie',
    capital: 'Rome',
    population: 59,
    area: 301340,
    languages: 'Italien',
    flag: 'https://www.countryflags.com/wp-content/uploads/italy-flag-png-large.png',
  ),
  const Country(
    name: 'Canada',
    capital: 'Ottawa',
    population: 39,
    area: 9984670,
    languages: 'Anglais',
    flag: 'https://www.countryflags.com/wp-content/uploads/canada-flag-png-large.png',
  ),
  const Country(
    name: 'Australie',
    capital: 'Canberra',
    population: 26,
    area: 7692024,
    languages: 'Anglais',
    flag: 'https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-9-2048x1024.jpg',
  ),
  const Country(
    name: 'Allemagne',
    capital: 'Berlin',
    population: 84,
    area: 357022,
    languages: 'Allemand',
    flag: 'https://www.countryflags.com/wp-content/uploads/germany-flag-png-large.png',
  ),
  const Country(
    name: 'Espagne',
    capital: 'Madrid',
    population: 47,
    area: 505990,
    languages: 'Espagnol',
    flag: "https://www.countryflags.com/wp-content/uploads/spain-flag-png-large.png",
  ),
  const Country(
    name: 'Afrique du Sud',
    capital: 'Pretoria',
    population: 60,
    area: 1219090,
    languages: 'Afrikaans',
    flag: "https://www.countryflags.com/wp-content/uploads/south-africa-flag-png-large.png",
  ),
];

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  void _showQuitDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quitter'),
        content: const Text('Voulez-vous quitter l\'application ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              // Close the app; SystemNavigator.pop is the recommended approach
              SystemNavigator.pop();
            },
            child: const Text('Quitter'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Pays'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    child: Icon(Icons.public, size: 32),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Atlas Géographique',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Découvrez les pays du monde',
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const WelcomePage()),
                  (route) => false,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('À propos'),
              onTap: () {
                Navigator.of(context).pop(); // close drawer
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Quitter'),
              onTap: () => _showQuitDialog(context),
            ),
          ],
        ),
      ),
      body: ListView.builder(
      itemCount: _sampleCountries.length,
      itemBuilder: (context, index) {
        final country = _sampleCountries[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            child: country.name == "Tunisie" ? Image.asset(
              "assets/flags/Tunisia_Big.png",
              width: 32,
              height: 32,
            ) : Image.network(
              country.flag,
              width: 32,
              height: 32,
          ),
          ),
          title: Text(country.name),
          subtitle: Text(country.capital),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CountryDetailPage(country: country),
              ),
            );
          },
        );
      },
      ),
    );
  }
}

