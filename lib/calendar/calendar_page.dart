import 'package:flutter/material.dart';
import 'calendar.dart'; // Assurez-vous que le chemin vers le widget du calendrier est correct

class CalendarPage extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page du Calendrier'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          child : CalendarWidget(), // Utilisez le widget du calendrier ici
      ),
      ),
    );
  }
}
