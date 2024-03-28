import 'package:flutter/material.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:enchanteddiary/header/header.dart';
import 'cloud.dart';

class Cloud extends StatelessWidget {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: CustomHeader(showBackButton: false),
      body: Column(
        children: [
          Expanded(
            child: CloudPage(), // Utilisez votre widget CloudPage ici
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            alignment: Alignment.center,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
