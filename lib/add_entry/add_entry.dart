import 'dart:ui';
import 'package:enchanteddiary/emotion/emotion.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:enchanteddiary/footer.dart';
import 'package:intl/intl.dart';

class AddEntryWidget extends StatefulWidget {
  final DateTime dateToAddEntry;

  const AddEntryWidget({
    Key? key,
    required this.dateToAddEntry,
  }) : super(key: key);

  @override
  State<AddEntryWidget> createState() => _AddEntryWidgetState();
}

class _AddEntryWidgetState extends State<AddEntryWidget> {
  Color appBarColor = Colors.white;
  void updateAppBarColor(Color color) {
    setState(() {
      appBarColor = color;
    });
  }

  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: CustomHeader(appBarColor: this.appBarColor),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      formatDate(widget.dateToAddEntry),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: lightBlue,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "weave a magic title... 🪄",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 19, color: lightBlue),
                    ),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Whispers of Moonlight"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "unravel your tale... ✨",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 19, color: lightBlue),
                    ),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 12),
                    keyboardType: TextInputType.multiline,
                    minLines: 8,
                    maxLines: 8,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Once upon a time, in a realm far away..."),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "cast an emotion... 🌟",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19, color: lightBlue),
                  ),
                ),
                EmojiMap(updateAppBarColor),
              ],
            ),
            Expanded(
                child: Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("SEAL"),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(37, 49, 56, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Color.fromRGBO(0, 83, 136, 1))))),
                ),
              ),
            )),
          ],
        ),
      ),
    ),
    Container(
    width: double.infinity,
    color: Colors.grey[200],
    child: Center(
    child: Footer(),
    ),
    ),
        ],
      ),
    );
  }
}

String formatDate(DateTime date) {
  var suffix = "th";
  int digit = date.day % 10;
  if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
    suffix = ["st", "nd", "rd"][digit - 1];
  }
  return "${date.day}$suffix of ${DateFormat('MMMM yyyy').format(date)}";
}
