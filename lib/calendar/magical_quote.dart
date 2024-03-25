import 'dart:math';
import 'package:flutter/material.dart';

class MagicalQuote extends StatelessWidget {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  final List<String> magicalQuotes = [
    "Believe in the magic within you.",
    "Let the magic within you light up the world around you.",
    "In a world of ordinary, dare to be enchanted.",
    "Find the magic in everyday moments.",
    "Let your imagination run wild and your dreams take flight.",
    "Life's an adventure – sprinkle it with a little enchantment.",
    "Embrace the whimsy of life and let the magic happen.",
    "In a world of chaos, create your own enchanting moments.",
    "Dance in the moonlight and let the stars guide your path.",
    "Unleash your inner magic and let your spirit soar.",
    "Open your heart to the enchantment all around you.",
    "Life's too short to be ordinary – let's make it magical!"
  ];

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    Random random = Random();
    int index = random.nextInt(magicalQuotes.length);
    String quote = magicalQuotes[index];

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: lightGray,
      ),
      child: Center(
        child: Text(
          quote,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenHeight * 0.03,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'DancingScript',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
