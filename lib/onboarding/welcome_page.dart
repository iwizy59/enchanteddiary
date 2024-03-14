import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'secure_page.dart';

class WelcomePageWidget extends StatelessWidget {
  const WelcomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/images/onboarding/burger.png",
                  width: ScreenWidth * 0.65),
              Text("Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Bienvenue sur '),
                    new TextSpan(
                        text: 'EnchantedDiary',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 80, 134, 1))),
                    new TextSpan(text: ' ton journal intime sécurisé'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecurePageWidget(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Suivant"),
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(0, 80, 134, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Color.fromRGBO(0, 80, 134, 1))))),
              ),
              DotsIndicator(
                dotsCount: 4,
                position: 0,
                decorator: DotsDecorator(
                  color: Color.fromRGBO(206, 214, 242, 1),
                  activeColor: Color.fromRGBO(0, 80, 134, 1),
                  size: Size(10, 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
