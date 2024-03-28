
import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/onboarding/welcome_page.dart';
import 'package:enchanteddiary/pin/pin_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _checkFirstStart();
  }

  _checkFirstStart() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstStart = prefs.getBool('isFirstStart') ?? true;

      if (isFirstStart) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePageWidget()),
        );
      }
      else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PinForm()),
        );
      }
    }



    @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded( 
          child: PageView(
            children: [
              CalendarPage()
            ], 
          ),
        ),
      ],
    );
  }
}
