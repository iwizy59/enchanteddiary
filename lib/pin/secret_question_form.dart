import 'package:enchanteddiary/pin/pin_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enchanteddiary/header/header.dart';

final Color lightYellow = Color(0xFFf7d6bf);

class SecretQuestionFormPage extends StatefulWidget {
  @override
  _SecretQuestionFormPageState createState() => _SecretQuestionFormPageState();
}

class _SecretQuestionFormPageState extends State<SecretQuestionFormPage> {
  final _answerController = TextEditingController();

  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  void _checkSecretAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    String correctAnswer = prefs.getString('secretAnswer') ?? '';
    if (_answerController.text == correctAnswer) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PinConfigPage()));
    } else {
      String errorMessage = 'Your answer is incorrect.';
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            '☹️ Failure ☹️',
            style: TextStyle(color: lightYellow, fontSize: 21.0),
          ),
          backgroundColor: darkBlue,
          content: Text(
            errorMessage,
            style: TextStyle(color: lightYellow),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Try again ✨',
                style: TextStyle(color: lightYellow),
              ),
            ),
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      backgroundColor: darkBlue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "What is your favorite color? 🎨",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: lightYellow,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _answerController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder:
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkBlue,
                      width: 1.0,
                  ),
                ),
                labelText: "Type your answer here 😊",
                labelStyle: TextStyle(
                  color: lightYellow,
                ),
                hintText: "Enter your favorite color 🟡",
                hintStyle: TextStyle(
                  color: lightYellow,
                ),
              ),
              style: TextStyle(
                  color: lightYellow,
                ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _checkSecretAnswer,
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
