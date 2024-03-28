import 'package:enchanteddiary/header/header.dart';
import 'package:enchanteddiary/pin/secret_question_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enchanteddiary/pin/pin_login.dart';

class PinConfigPage extends StatefulWidget {
  const PinConfigPage({Key? key}) : super(key: key);

  @override
  _PinConfigPageState createState() => _PinConfigPageState();
}

class _PinConfigPageState extends State<PinConfigPage> {
  String enteredPin = '';

  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: CustomHeader(showBackButton: false,),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to EnchantedDiary! 📖\n\nTo secure your personal space, set up a 4-character PIN. 😊',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: lightYellow,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 20,),
            ),
            Text(
              enteredPin,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: lightYellow,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PinButton(
                  number: '1',
                  onPressed: () => _onPinButtonPressed('1'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '2',
                  onPressed: () => _onPinButtonPressed('2'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '3',
                  onPressed: () => _onPinButtonPressed('3'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PinButton(
                  number: '4',
                  onPressed: () => _onPinButtonPressed('4'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '5',
                  onPressed: () => _onPinButtonPressed('5'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '6',
                  onPressed: () => _onPinButtonPressed('6'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PinButton(
                  number: '7',
                  onPressed: () => _onPinButtonPressed('7'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '8',
                  onPressed: () => _onPinButtonPressed('8'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '9',
                  onPressed: () => _onPinButtonPressed('9'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PinButton(
                  number: 'X',
                  onPressed: _onClearButtonPressed,
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '0',
                  onPressed: () => _onPinButtonPressed('0'),
                  color: lightYellow,
                  textColor: darkBlue,
                ),
                PinButton(
                  number: '<',
                  onPressed: _onRemoveButtonPressed,
                  color: lightYellow,
                  textColor: darkBlue,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _onValidateButtonPressed(context),
              child: Text('Validation'),
              style: ElevatedButton.styleFrom(
                backgroundColor: lightYellow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPinButtonPressed(String digit) {
    setState(() {
      if (enteredPin.length < 4) {
        enteredPin += digit;
      }
    });
  }

  void _onRemoveButtonPressed() {
    setState(() {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      }
    });
  }

  void _onClearButtonPressed() {
    setState(() {
      enteredPin = '';
    });
  }


  Future<void> _onValidateButtonPressed(BuildContext context) async {
  if (enteredPin.length != 4) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('☹️ ERROR ☹️',
              style: TextStyle(color: lightYellow)),
          backgroundColor: darkBlue,
          content: Text('Your PIN bust me 4-character long.',
              style: TextStyle(color: lightYellow)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Alright ✨', style: TextStyle(color: lightYellow)),
            ),
          ],
        ),
    );
  } else {
    print('Code PIN enregistré: $enteredPin');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pin', enteredPin);
    final isFirstStart = prefs.getBool('isFirstStart') ?? true;

    if(isFirstStart)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecretQuestionConfigPage()),
      );
    }
    else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PinForm()),
      );
    }
  }
}

}

class PinButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const PinButton({
    Key? key,
    required this.number,
    required this.onPressed,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          number,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }
}