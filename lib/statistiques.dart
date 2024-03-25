import 'package:flutter/material.dart';
import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:enchanteddiary/database/models/note_model.dart';

class EnchantedStats extends StatefulWidget {
  @override
  _EnchantedStatsState createState() => _EnchantedStatsState();
}

class _EnchantedStatsState extends State<EnchantedStats> {
  int totalWords = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotalWords();
  }

  Future<void> _calculateTotalWords() async {
    final List<Note> allNotes = await NoteDataSource.getAllNotes();
    int total = 0;
    for (var note in allNotes) {
      total += _countWords(note.text);
    }
    setState(() {
      totalWords = total;
    });
  }

  int _countWords(String text) {
    if (text.isEmpty) return 0;
    return text.split(RegExp(r'\s+')).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Words in All Notes:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              '$totalWords',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
