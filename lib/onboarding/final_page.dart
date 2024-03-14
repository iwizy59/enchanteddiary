import 'package:dots_indicator/dots_indicator.dart';
import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:enchanteddiary/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinalPageWidget extends StatelessWidget {
  const FinalPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomHeader(showBackButton: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/images/onboarding/check.png",
                  width: ScreenWidth * 0.65),
              Text("It's ready !",
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
                    new TextSpan(text: 'You will finally be able to enjoy your '),
                    new TextSpan(
                        text: 'EnchantedDiary',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 80, 134, 1))),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarPage(
                      ),
                    ),
                  );
                  await prefs.setBool('isFirstStart', false);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Next"),
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
                position: 3,
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
