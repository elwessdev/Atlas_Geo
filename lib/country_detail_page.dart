import 'package:flutter/material.dart';
import 'models/country.dart';

class CountryDetailPage extends StatelessWidget {
  final Country country;

  const CountryDetailPage({super.key, required this.country});

  String _formatPopulation(int pop) {
    final millions = pop / 1000000.0;
    final str = millions >= 10 ? millions.toStringAsFixed(0) : millions.toStringAsFixed(1);
    return '$str millions d\'habitants';
  }

  String _formatArea(int area) {
    return '$area km2';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            // Large flag display
            Center(
              child: country.name == "Tunisie" ? Image.asset(
                'assets/flags/Tunisia_Big.png',
                width: 150,
                height: 100,
              ) : Image.network(
                country.flag,
                width: 150,
                height: 100,
              )
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow('Capitale', country.capital),
                    const SizedBox(height: 8),
                    _infoRow('Population', _formatPopulation(country.population)),
                    const SizedBox(height: 8),
                    _infoRow('Superficie', _formatArea(country.area)),
                    const SizedBox(height: 8),
                    _infoRow('Langue officielle', country.languages),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            '$label :',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: Text(value)),
      ],
    );
  }
}
