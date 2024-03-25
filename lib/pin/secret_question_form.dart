import 'package:enchanteddiary/pin/pin_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecretQuestionFormPage extends StatefulWidget {
  @override
  _SecretQuestionFormPageState createState() => _SecretQuestionFormPageState();
}

class _SecretQuestionFormPageState extends State<SecretQuestionFormPage> {
  final _answerController = TextEditingController();

  void _checkSecretAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    String correctAnswer = prefs.getString('secretAnswer') ?? '';
    if (_answerController.text == correctAnswer) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PinConfigPage())); // Votre page de réinitialisation de PIN
    } else {
      // Afficher une erreur
    }
  }

  final Color darkBlue = Color(0xFF001244);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Answer Secret Question", style: TextStyle (color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Couleur de la flèche de retour et d'autres icônes
        ),
        backgroundColor: darkBlue, // Couleur personnalisée de l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Augmenter le padding pour plus d'espace
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligner les widgets à gauche
          children: [
            SizedBox(height: 20), // Ajouter de l'espace au-dessus de la question
            Text(
              "What is your favorite color?",
              style: TextStyle(
                fontSize: 18, // Taille de police plus grande
                fontWeight: FontWeight.bold, // Rendre le texte en gras
                color: darkBlue, // Couleur du texte
              ),
            ),
            SizedBox(height: 10), // Espacer la question du champ de saisie
            TextField(
              controller: _answerController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder:
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkBlue, // Couleur de la bordure par défaut
                      width: 1.0, // Épaisseur de la bordure
                  ),
                ),// Ajouter une bordure au champ de texte
                labelText: "Your Answer",
                labelStyle: TextStyle(
                  color: darkBlue, // Change la couleur du labelText
                ),// Placeholder personnalisé
                hintText: "Enter your favorite color",
              ),
            ),
            SizedBox(height: 20), // Espacer le champ de saisie du bouton
            Center(
              child: ElevatedButton(
                onPressed: _checkSecretAnswer,
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: darkBlue, // Couleur du texte du bouton
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Padding plus grand pour le bouton
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
