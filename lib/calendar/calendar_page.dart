import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'calendar.dart';
import 'magical_quote.dart';

class CalendarPage extends StatelessWidget {

  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGray,
      appBar: CustomHeader(showBackButton: false),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(30),
                child: CalendarWidget(),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              alignment: Alignment.center,
              child: MagicalQuote(),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              alignment: Alignment.center,
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}

