import 'dart:ui';
import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:enchanteddiary/emotion/emotion.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:enchanteddiary/footer.dart';

import '../database/models/note_model.dart';
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
  Note? thisNote = null;
  final TitleController = TextEditingController();
  final TextController = TextEditingController();

  Color appBarColor = Colors.white;
  void updateAppBarColor(Color color) {
    setState(() {
      appBarColor = color;
    });
  }

  @override
  void initState() {
    super.initState();
    thisNote = null;
    fetchData();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    TitleController.dispose();
    TextController.dispose();
    super.dispose();
  }

  void fetchData() async {
    Note? loadedNote =
        await NoteDataSource.getNoteForDate(widget.dateToAddEntry);
    setState(() {
      if (loadedNote != null) {
        thisNote = loadedNote;
        TitleController.text = loadedNote.title;
        TextController.text = loadedNote.text;
        appBarColor = loadedNote.color;
      }
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
      bottomNavigationBar:
        Container(
        width: double.infinity,
        color: Colors.grey[200],
        child:  Footer(),
      ),


      backgroundColor: lightYellow,
      appBar: CustomHeader(appBarColor: this.appBarColor),
      body: SafeArea( child : SingleChildScrollView( child :Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "weave a magic title... 🪄",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 19,
                                color: lightBlue),
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 12),
                          controller: TitleController,
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "unravel your tale... ✨",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 19,
                                color: lightBlue),
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 12),
                          keyboardType: TextInputType.multiline,
                          controller: TextController,
                          minLines: 8,
                          maxLines: 8,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              hintText:
                                  "Once upon a time, in a realm far away..."),
                        ),
        ],

                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "cast an emotion... 🌟",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                              color: lightBlue),
                        ),
                      ),
                      EmojiMap(updateAppBarColor),
                    ],
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final int? id = thisNote?.id;
                          final String title = TitleController.text;
                          final String text = TextController.text;
                          final Color color = appBarColor;
                          final DateTime date = widget.dateToAddEntry;

                          final Note newNote = Note(
                              id: id,
                              title: title,
                              text: text,
                              color: color,
                              date: date);

                          NoteDataSource.insertOrUpdateNote(newNote);

                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("SEAL"),
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(37, 49, 56, 1)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                        color:
                                            Color.fromRGBO(0, 83, 136, 1))))),
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
      ),
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
