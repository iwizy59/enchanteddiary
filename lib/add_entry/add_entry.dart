import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddEntryWidget extends StatefulWidget {
  final DateTime dateToAddEntry;

  const AddEntryWidget({
    super.key,
    required this.dateToAddEntry,
  });

  @override
  State<AddEntryWidget> createState() => _AddEntryWidgetState();
}

class _AddEntryWidgetState extends State<AddEntryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "${widget.dateToAddEntry.day}/${widget.dateToAddEntry.month}/${widget.dateToAddEntry.year}",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
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
                      "Give a title...",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                    ),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Mon crush..."),
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
                      "Tell us everything...",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
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
                        hintText: "Aabababababab"),
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
                    "Choose an emotion...",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                  ),
                ),
                Container(
                  height: 70,
                  color: Colors.amber,
                )
              ],
            ),
            Expanded(
                child: Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Terminer"),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(0, 83, 136, 1)),
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
    );
  }
}
