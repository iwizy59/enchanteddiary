import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/onboarding/final_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enchanteddiary/main.dart';

class PinForm extends StatefulWidget {
  @override
  _PinFormState createState() => _PinFormState();
}


class _PinFormState extends State<PinForm> {
  String enteredPin = '';

  // Color palette from provided hex codes
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        title: Text(
          'Connexion',
          style: TextStyle(color: lightYellow),
        ),
        backgroundColor: darkBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome back to EnchantedDiary!\n\nTo access your personal space, please enter your PIN.\n\n',
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
              onPressed: () => _authenticate(context),
              child: Text('Valider'),
              style: ElevatedButton.styleFrom(
                backgroundColor: lightYellow, // Couleur lightBlue
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

  void _authenticate(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final savedPin = prefs.getString('pin');

    print(savedPin);
    print(enteredPin);
    if (savedPin == enteredPin) {
      final isFirstStart = prefs.getBool('isFirstStart') ?? true;
      if(isFirstStart){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FinalPageWidget()));
      }
      else
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalendarPage()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Authentification échouée'),
          content: Text('Le code PIN saisi est incorrect.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

class PinButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor; // Couleur du texte

  const PinButton({
    Key? key,
    required this.number,
    required this.onPressed,
    required this.color,
    required this.textColor, // Couleur du texte
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          number,
          style: TextStyle(color: textColor), // Couleur du texte
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }
}
