import 'package:enchanteddiary/pin/pin_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecretQuestionConfigPage extends StatefulWidget {
  @override
  _SecretQuestionConfigPageState createState() => _SecretQuestionConfigPageState();
}

class _SecretQuestionConfigPageState extends State<SecretQuestionConfigPage> {
  final _answerController = TextEditingController();
  final _answerUsernameController = TextEditingController();

  void _saveSecretAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('secretAnswer', _answerController.text);
    await prefs.setString('username', _answerUsernameController.text);

    await prefs.setBool('isFirstStart', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PinForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set Secret Question and Username")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Enter your username"), // Exemple de question secrète
            TextField(controller: _answerUsernameController),
            Text("What is your favorite color?"), // Exemple de question secrète
            TextField(controller: _answerController),
            ElevatedButton(onPressed: _saveSecretAnswer, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
