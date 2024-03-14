import 'package:flutter/material.dart';


class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView( // Ajouté pour permettre le défilement si le contenu est long
        padding: const EdgeInsets.all(16), // Ajouté pour un peu d'espace autour du texte
        child: Column( // Utiliser Column pour organiser le contenu verticalement
          crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte à gauche
          children: [
            Text(
              'About EnchantedDiary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Espace entre le titre et la description
            Text(
              'EnchantedDiary is a magical digital diary designed to offer an immersive and captivating experience. It aims to foster introspection among its users, help manage their emotions, and meaningfully anchor their memories.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // Espace avant la section suivante
            Text(
              'Defining Your Daily Emotion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Defining your daily emotion in EnchantedDiary helps in understanding your emotional patterns over time, encouraging emotional awareness and growth. It is a step towards mindful introspection and personal development.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
