import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';

class FancyTermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/terms_and_conditions_banner.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome to Enchanted Diary, where your dreams come true!',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'By using our app, you agree to the following terms and conditions:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 16.0),
            ),
            // Ajoutez autant d'éléments de texte que nécessaire pour les termes et conditions
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque l'utilisateur accepte les termes et conditions
                  },
                  child: Text('Accept'),
                ),
                SizedBox(width: 20.0),
                OutlinedButton(
                  onPressed: () {
                    // Action à effectuer lorsque l'utilisateur refuse les termes et conditions
                  },
                  child: Text('Decline'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
