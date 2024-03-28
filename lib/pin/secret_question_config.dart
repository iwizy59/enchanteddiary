import 'package:enchanteddiary/pin/pin_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enchanteddiary/header/header.dart';

class SecretQuestionConfigPage extends StatefulWidget {
  @override
  _SecretQuestionConfigPageState createState() => _SecretQuestionConfigPageState();
}

class _SecretQuestionConfigPageState extends State<SecretQuestionConfigPage> {
  final _answerController = TextEditingController();
  final _answerUsernameController = TextEditingController();

  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

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
      appBar: CustomHeader(),
      backgroundColor: darkBlue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Enter your username 🕵️",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: lightYellow,
              ),
            ),
            TextField(
              controller: _answerUsernameController,
              style: TextStyle(
                  color: lightYellow,
              ),),
            SizedBox(height: 20),
            Text(
              "What is your favorite color? 🎨",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: lightYellow,
              ),
            ),
            TextField(
              controller: _answerController,
              style: TextStyle(
                  color: lightYellow,
              ),),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveSecretAnswer,
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: skyBlue, backgroundColor: lightYellow,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
