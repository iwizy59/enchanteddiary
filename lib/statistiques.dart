import 'package:flutter/material.dart';
import 'package:enchanteddiary/header/header.dart';
import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:enchanteddiary/database/models/note_model.dart';
import 'package:intl/intl.dart';

class EnchantedStats extends StatefulWidget {
  @override
  _EnchantedStatsState createState() => _EnchantedStatsState();
}

class _EnchantedStatsState extends State<EnchantedStats> {
  int totalWords = 0;
  int totalNotes = 0;
  int average = 0;
  String longestNote = '';
  String longestNoteDate = '';
  String longestDailyEntriesDuration = ''; // Nouvelle statistique ajoutée

  @override
  void initState() {
    super.initState();
    _calculateTotalWords();
    _findLongestNote();
    _findLongestDailyEntriesDuration(); // Appel de la nouvelle fonction
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

  Future<void> _findLongestNote() async {
    final List<Note> allNotes = await NoteDataSource.getAllNotes();
    String longestNoteText = '';
    DateTime? longestNoteDateTime;
    for (var note in allNotes) {
      if (note.text.length > longestNoteText.length) {
        longestNoteText = note.text;
        longestNoteDateTime = note.date;
      }
    }
    setState(() {
      longestNote = longestNoteText;
      if (longestNoteDateTime != null) {
        longestNoteDate = DateFormat('dd/MM/yyyy').format(longestNoteDateTime);
      }
    });
  }

  Future<void> _findLongestDailyEntriesDuration() async {
    final List<Note> allNotes = await NoteDataSource.getAllNotes();
    List<DateTime> noteDates = allNotes.map((note) => note.date).toList();
    noteDates
        .sort((a, b) => a.compareTo(b)); // Trier les dates par ordre croissant
    int longestDuration = 0;
    DateTime? startDate;
    DateTime? endDate;

    for (int i = 0; i < noteDates.length - 1; i++) {
      DateTime currentDate = noteDates[i];
      DateTime nextDate = noteDates[i + 1];
      int duration = nextDate.difference(currentDate).inDays;
      if (duration > longestDuration) {
        longestDuration = duration;
        startDate = currentDate;
        endDate = nextDate;
      }
    }

    if (longestDuration > 0 && startDate != null && endDate != null) {
      longestDailyEntriesDuration =
          '${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)} (${longestDuration + 1} jours)'; // Ajout de la durée en jours
    }
  }

  int _countWords(String text) {
    if (text.isEmpty) return 0;
    return text.split(RegExp(r'\s+')).length;
  }

  int _average() {
    if (totalNotes != 0) {
      average = (totalWords / totalNotes).round();
    }
    return average.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 214, 191, 1.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Enchanted Stats',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              StatItem(
                title: 'Total Words in All Notes:',
                value: '$totalWords',
              ),
              StatItem(
                title: 'Total Notes:',
                value: '$totalNotes',
              ),
              StatItem(
                title: 'Average Words per Note:',
                value: '$average',
              ),
              if (longestNote.isNotEmpty)
                StatItem(
                  title: 'Longest Note: Date: $longestNoteDate',
                  value: '$longestNote',
                ),
              if (longestDailyEntriesDuration.isNotEmpty)
                StatItem(
                  title: 'Enchanted Streaks:',
                  value: longestDailyEntriesDuration,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String title;
  final String value;

  const StatItem({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5E503F),
            ),
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF5E503F),
            ),
          ),
        ],
      ),
    );
  }
}
