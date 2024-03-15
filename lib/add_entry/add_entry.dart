import 'dart:ui';
import 'package:enchanteddiary/calendar/calendar_page.dart';
import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:enchanteddiary/emotion/emotion.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:enchanteddiary/footer.dart';

import '../database/models/note_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 19),
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 12),
                          controller: TitleController,
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
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 19),
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
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19),
                        ),
                      ),
                      EmojiMap(updateAppBarColor),
                    ],
                  ),
                  Expanded(
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
                          child: Text("Terminer"),
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
          // Footer ici, en dehors de Expanded mais toujours dans Column.
          Container(
            width: double.infinity,
            color: Colors.grey[200], // Adjustez selon vos besoins
            child: Center(
              child: Footer(), // Remplacez par votre widget de footer
            ),
          ),
        ],
      ),
    );
  }
}
