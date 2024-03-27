import 'dart:math';

import 'package:enchanteddiary/database/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scatter/flutter_scatter.dart';
import 'package:enchanteddiary/database/data_sources/note_data_source.dart';
import 'package:stopwordies/stopwordies.dart';

class CloudPage extends StatefulWidget {
  @override
  _CloudPageState createState() => _CloudPageState();
}

class _CloudPageState extends State<CloudPage> {
  int numberOfWords = 10; // Nombre de mots par défaut
  late DateTime startDate = DateTime(2024, 3, 1); // Date de début par défaut
  late DateTime endDate = DateTime.now(); // Date de fin par défaut

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Number of words: $numberOfWords',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
          ),
          Slider(
            value: numberOfWords.toDouble(),
            min: 1,
            max: 50,
            divisions: 50,
            label: numberOfWords.toString(),
            onChanged: (value) {
              setState(() {
                numberOfWords = value.toInt();
              });
            },
          ),
        ],
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Start:',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),),
          IconButton(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: startDate,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                setState(() {
                  startDate = selectedDate;
                });
              }
            },
            icon: Icon(Icons.calendar_today),
          ),
          Text(startDate.toString().split(' ')[0],
              style: TextStyle(
                fontFamily: 'Poppins',
              ),),
          Text('End:',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),),
          IconButton(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: endDate,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                setState(() {
                  endDate = selectedDate;
                });
              }
            },
            icon: Icon(Icons.calendar_today),
          ),
          Text(endDate.toString().split(' ')[0],
              style: TextStyle(
                fontFamily: 'Poppins',
              ),),
        ],
      ),
    ],
  ),
),

        Expanded(
          child: FutureBuilder<List<WordData>>(
            future: getTopWords(numberOfWords, startDate, endDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final List<WordData> topWords = snapshot.data!;
                return CloudWidget(wordsData: topWords);
              }
            },
          ),
        ),
      ],
    );
  }

  Future<List<WordData>> getTopWords(int numberOfWords, DateTime startDate, DateTime endDate) async {
    // Récupérer toutes les notes entre les dates sélectionnées
    final List<Note> notes = await NoteDataSource.getNotesBetweenDates(startDate, endDate);

    // Liste des mots à ignorer (prépositions, mots courts, etc.)
    final List<String> wordsToIgnore = await StopWordies.getFor(locale: SWLocale.fr);
    // Compter la fréquence de chaque mot
    final Map<String, int> wordFrequency = {};
    for (final note in notes) {
      final List<String> words = note.text.replaceAll(RegExp(r'[,.]'), '').split(' '); // Supprimer les virgules et les points
      for (final word in words) {
        if (!wordsToIgnore.contains(word.toLowerCase()) && word.length > 3) {
          if (wordFrequency.containsKey(word)) {
            wordFrequency[word] = wordFrequency[word]! + 1;
          } else {
            wordFrequency[word] = 1;
          }
        }
      }
    }

    // Trier les mots par fréquence décroissante
    final List<MapEntry<String, int>> sortedEntries =
        wordFrequency.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    // Sélectionner le nombre spécifié de mots
    final List<MapEntry<String, int>> topEntries =
        sortedEntries.take(numberOfWords).toList();

    // Calculer la fréquence maximale pour normaliser la taille des mots
    final int maxFrequency = topEntries.isNotEmpty ? topEntries.first.value : 1;

    // Générer des données pour chaque mot
    final List<WordData> wordsData = topEntries.map((entry) {
      final double frequencyRatio = entry.value / maxFrequency;
      final double fontSize = 20 + 40 * frequencyRatio; // Taille proportionnelle à la fréquence
      return WordData(entry.key, entry.value, fontSize);
    }).toList();

    return wordsData;
  }
}

class WordData {
  final String word;
  final int frequency;
  final double fontSize;

  WordData(this.word, this.frequency, this.fontSize);
}

class CloudWidget extends StatelessWidget {
  final List<WordData> wordsData;

  const CloudWidget({required this.wordsData});

  @override
  Widget build(BuildContext context) {
    // Mélanger la liste de mots
    final shuffledWordsData = wordsData.toList()..shuffle();

    final List<Widget> widgets = shuffledWordsData
        .mapIndexed((index, wordData) => ScatterItem(wordData, index))
        .toList();

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;

    return Center(
      child: FittedBox(
        child: Scatter(
          fillGaps: true,
          delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
          children: widgets,
        ),
      ),
    );
  }
}


extension IterableExtension<T> on Iterable<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T item) f) sync* {
    var index = 0;
    for (final item in this) {
      yield f(index, item);
      index++;
    }
  }
}

class ScatterItem extends StatelessWidget {
  final WordData wordData;
  final int index;

  final Color red = Color(0xFFFF0000);
  final Color orange = Color(0xFFFFA500);
  final Color yellow = Color(0xFFFFFF00);
  final Color green = Color(0xFF008000);
  final Color blue = Color(0xFF0000FF);
  final Color purple = Color(0xFF800080);
  final Color pink = Color(0xFFFF69B4);

  ScatterItem(this.wordData, this.index);

  
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      red,
      orange,
      yellow,
      green,
      blue,
      purple,
      pink,
    ];

    final textStyle = Theme.of(context).textTheme?.subtitle1;
    final style = textStyle?.copyWith(
      fontSize: wordData.fontSize,
      color: colors[Random().nextInt(colors.length)], // Sélectionne une couleur aléatoire parmi la liste des couleurs disponibles
    );
    return RotatedBox(
      quarterTurns: index.isEven ? 0 : 1,
      child: Text(
        wordData.word,
        style: style,
      ),
    );
  }
}
