import 'package:flutter/material.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:enchanteddiary/emotion/emotion.dart';

class HelpPage extends StatelessWidget {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: CustomHeader(showBackButton: true),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '⚗️ ABOUT EnchantedDiary...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: lightBlue),
            ),
            SizedBox(height: 10),
            Text(
              "Welcome to EnchantedDiary, your digital heaven station to capture moments and emotions of your life. Dive into a place where every entry is an enchanting experience, weaving tales of your life's journey. So are you ready for a magical journaling adventure? It's time to dream... and shine brighter!\n",
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: darkBlue),
            ),
            Text(
              '✨ DAILY MOOD feature',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: lightBlue),
            ),
            SizedBox(height: 10),
            Text(
              "Share the magic in every moment with the daily mood feature. Select from a spectrum of enchanting emotions to capture the essence of your daily experiences. Watch as your entries come alive, the million splashes of colours popping on your calendar. A true reflection of your inner mind.\n",
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: darkBlue),
            ),
            Text(
              '☁️ WORLD CLOUD feature',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: lightBlue),
            ),
            SizedBox(height: 10),
            Text(
              "Behold the mystical world cloud, where your words transcend into art. Simply choose a date range, and watch as the most enchanting wwords from your entries dance together in a captivating display. Let the world cloud illuminate the essence of your journey in a spellbinding visual experience.",
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: darkBlue),
            ),
          ],
        ),
      ),
    );
  }
}
