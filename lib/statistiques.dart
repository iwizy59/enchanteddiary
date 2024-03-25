import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:enchanteddiary/database/models/note_model.dart';

class EnchantedStats extends StatefulWidget {
  @override
  _EnchantedStatsState createState() => _EnchantedStatsState();
}

class _EnchantedStatsState extends State<EnchantedStats> {
  int totalWords = 0;
  int totalNotes = 0;
  double average = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalWords();
  }

  Future<void> _calculateTotalWords() async {
    final List<Note> allNotes = await NoteDataSource.getAllNotes();
    int totalWordsTemp = 0;
    for (var note in allNotes) {
      totalWordsTemp += _countWords(note.text);
      totalNotes++;
    }
    setState(() {
      totalWords = totalWordsTemp;
      totalNotes = totalNotes;
      _average();
    });
  }

  int _countWords(String text) {
    if (text.isEmpty) return 0;
    return text.split(RegExp(r'\s+')).length;
  }

  double _average() {
    average = totalWords / totalNotes;
    return average;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Words in All Notes: $totalWords',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Total input : $totalNotes",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Average : $average",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
