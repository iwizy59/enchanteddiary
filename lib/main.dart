import 'package:enchanteddiary/emotion.dart';
import 'package:flutter/material.dart';
import 'package:enchanteddiary/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color appBarColor = Colors.cyan;
  void updateAppBarColor(Color color) {
    setState(() {
      appBarColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: appBarColor,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "1 mars 2024",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              EmojiMap(updateAppBarColor),
              Footer(),
            ]));
  }
}
