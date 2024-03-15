import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:flutter/material.dart';

import 'database/models/note_model.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  Note? thisNote = await NoteDataSource.getNoteForDate(
                      DateTime(DateTime.now().year, 3, 15));
                  if (thisNote != null) {
                    print(thisNote.id);
                    print(thisNote.title);
                    print(thisNote.text);
                    print(thisNote.date);
                    print(thisNote.color);
                    print("\n");
                  } else {
                    print("hess");
                  }
                },
                child: Text("Fetch 15 Mars")),
            ElevatedButton(
                onPressed: () async {
                  List<Note> list = await NoteDataSource.getAllNotes();
                  for (var element in list) {
                    print(element.id);
                    print(element.title);
                    print(element.text);
                    print(element.date);
                    print(element.color);
                    print("\n");
                  }
                },
                child: Text("Fetch Data")),
          ],
        )));
  }
}
