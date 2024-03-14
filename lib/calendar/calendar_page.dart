import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';
import 'calendar.dart'; // Assurez-vous que le chemin vers le widget du calendrier est correct

class CalendarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(), // Votre en-tête personnalisé
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(30),
                child: CalendarWidget(), // Votre CalendarWidget
              ),
            ),
            Container(

              // Hauteur du footer, ajustez selon vos besoins
              width: double.infinity,
              // Le footer prend toute la largeur disponible
              color: Colors.grey[200],
              // Couleur de fond du footer, ajustez selon vos besoins
              alignment: Alignment.center,
              // Pour centrer le contenu dans le footer
              child: Footer(), // Contenu du footer
            ),
          ],
        ),
      ),
    );
  }
}

