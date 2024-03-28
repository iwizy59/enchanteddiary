import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';

class FancyTermsAndConditionsPage extends StatelessWidget {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      backgroundColor: lightYellow,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: lightBlue,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '🎊 Welcome to Enchanted Diary! 🎊',
              style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 20.0),
            Text(
              'By using our app, you agree to the following terms and conditions:',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 10.0),
            Text(
              '1. You are responsible for maintaining the confidentiality of your account.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            Text(
              '2. You agree not to use the app for any illegal or unauthorized purpose.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            Text(
              '3. We reserve the right to modify or terminate the app for any reason, without notice.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Accept', style: TextStyle(color: darkBlue, fontFamily: 'Poppins'),),
                ),
                SizedBox(width: 20.0),
                OutlinedButton(
                  onPressed: () {
                  },
                  child: Text('Decline', style: TextStyle(color: darkBlue, fontFamily: 'Poppins'),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
