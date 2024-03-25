import 'dart:ui';

import 'package:enchanteddiary/database/database_helper.dart';
import 'package:enchanteddiary/database/models/note_model.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

Future<Map<DateTime, Color>> getNoteColorsForMonth(DateTime firstDay, DateTime lastDay) async {
  final db = await DatabaseHelper.getDB();
  String firstDayStr = DateFormat('yyyy-MM-dd').format(firstDay);
  String lastDayStr = DateFormat('yyyy-MM-dd').format(lastDay);

  final List<Map<String, dynamic>> maps = await db.query(
    'Note',
    where: "date >= ? AND date <= ?",
    whereArgs: [firstDayStr, lastDayStr],
  );
  Map<DateTime, Color> noteColors = {};
  for (var map in maps) {
    DateTime date = DateTime.parse(map['date']);
    // Supposons que map['color'] est une chaîne hexadécimale, par exemple "#ff5733"
    String colorString = map['color']; // Obtenez la chaîne de la base de données
    colorString = colorString.replaceFirst('#', ''); // Retirez le #
    int colorInt = int.parse(colorString, radix: 16); // Convertissez en entier
    Color color = Color(colorInt + 0xFF000000); // Créez l'objet Color
    noteColors[date] = color;
  }
  return noteColors;
}