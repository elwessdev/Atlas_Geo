import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Atlas Géographique\n\nCette application présente une liste de pays et permet de découvrir des informations basiques.\n\nDéveloppé pour l\'examen pratique.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
