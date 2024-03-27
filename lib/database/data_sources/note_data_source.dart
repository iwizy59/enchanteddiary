import 'package:enchanteddiary/database/database_helper.dart';
import 'package:enchanteddiary/database/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteDataSource {
  static Future<List<Note>> getAllNotes() async {
    final Database db = await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query('Note');
    return maps.map((json) => Note.fromJson(json)).toList();
  }

  static Future<Note?> getNoteForDate(DateTime thisDate) async {
    final db = await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'Note',
      where: 'strftime("%Y-%m-%d", date) = ?',
      whereArgs: [thisDate.toIso8601String().substring(0, 10)],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      return null; // Retourner null si aucune note correspondante n'est trouvée
    }
  }

  static Future<void> insertOrUpdateNote(Note note) async {
    final existingNote = await getNoteForDate(note.date);
    if (existingNote != null) {
      await updateNote(note);
    } else {
      await insertNote(note);
    }
  }

  static Future<void> insertNote(Note note) async {
    final db = await DatabaseHelper.getDB();
    print(note.toJson());
    await db.insert(
      'Note',
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateNote(Note note) async {
    final db = await DatabaseHelper.getDB();
    await db.update(
      'Note',
      note.toJson(),
      where: 'strftime("%Y-%m-%d", date) = ?',
      whereArgs: [note.date.toIso8601String().substring(0, 10)],
    );
  }

  static Future<List<Note>> getNotesBetweenDates(DateTime startDate, DateTime endDate) async {
    final db = await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'Note',
      where: 'date BETWEEN ? AND ?',
      whereArgs: [startDate.toIso8601String().substring(0, 10), endDate.toIso8601String().substring(0, 10)],
    );
    return maps.map((json) => Note.fromJson(json)).toList();
  }
}
