import 'package:flutter/material.dart';

class Note {
  final int? id;
  final String title;
  final String text;
  final Color color;
  final DateTime date;

  Note({
    required this.id,
    required this.title,
    required this.text,
    required this.color,
    required this.date,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        text: json['text'],
        color: hexToColor(json['color']),
        date: DateTime.parse(json['date']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'text': text,
        'color': colorToHex(color),
        'date': date.toIso8601String(),
      };

  static Color hexToColor(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  // Méthode pour convertir une couleur Color en sa représentation hexadécimale
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }
}
