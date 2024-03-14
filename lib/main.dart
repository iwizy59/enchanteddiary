
import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/header/header.dart';

import 'package:enchanteddiary/onboarding/welcome_page.dart';
import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/pin/pin_config.dart';
import 'package:enchanteddiary/pin/pin_login.dart';
import 'package:flutter/material.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
        // Navigate to Onboarding and set isFirstStart to false after it's done
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePageWidget()),
        );
        await prefs.setBool(
            'isFirstStart', false); // Your onboarding page route
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

        Expanded( // Ajoutez ce widget ici
          child: PageView(
            children: [
              CalendarPage()
            ], // Assurez-vous que CalendarPage est bien défini ailleurs dans votre code
          ),
        ),
      ],
    );
  }
}
