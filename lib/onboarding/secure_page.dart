import 'package:dots_indicator/dots_indicator.dart';
import 'package:enchanteddiary/onboarding/final_page.dart';
import 'package:enchanteddiary/pin/pin_config.dart';
import 'package:flutter/material.dart';
import 'package:enchanteddiary/header/header.dart';


class SecurePageWidget extends StatelessWidget {
  const SecurePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    final Color darkBlue = Color(0xFF001244);
    final Color lightBlue = Color(0xFF005086);
    final Color skyBlue = Color(0xFF318fb5);
    final Color lightGray = Color(0xFFb0cac7);
    final Color lightYellow = Color(0xFFf7d6bf);

    return Scaffold(
      backgroundColor: lightYellow,
      appBar: CustomHeader(showBackButton: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/images/onboarding/car.png",
                  width: ScreenWidth * 0.65),
              Text("Security",
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
                    new TextSpan(
                        text:
                            'First, you will need to set a PIN to secure your Diary.'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PinConfigPage(),
                    ),
                  );
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
                position: 1,
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
