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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Answer Secret Question")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("What is your favorite color?"), // La même question secrète
            TextField(controller: _answerController),
            ElevatedButton(onPressed: _checkSecretAnswer, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
