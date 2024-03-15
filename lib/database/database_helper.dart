import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "EnchantedDiary.db";

  static Future<Database> getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE Note (
            id INTEGER PRIMARY KEY,
            title TEXT,
            text TEXT,
            date DATE,
            color TEXT
          )
        ''');
    }, version: _version);
  }
}
