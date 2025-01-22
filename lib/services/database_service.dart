import 'dart:developer';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import '../model/note_model.dart';

class DatabaseService {
  // MAKING SINGLE TONE OBJECT
  DatabaseService._();

  static final DatabaseService databaseService = DatabaseService._();

  // INSTANCE OF DATABASE
  Database? _database;

  // TABLE DATA
  final _tableName = "notes";
  final _id = "id";
  final _title = "title";
  final _note = "note";
  final _date = "date";
  final _time = "time";

  Future<Database> get database async {
    if (_database != null) {
      log("Using existing database ----------");
      return _database!;
    } else {
      log("Creating database ----------");
      _database = await createDatabase();
      return _database!;
    }
  }

  //  CREATE DATABASE
  Future<Database> createDatabase() async {
    log("Create database called --------");

    final filePath = await getDatabasesPath();
    final dbPath = path.join(filePath, "myDatabase.db");

    // OPENING DATABASE
    Database myDb = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        log("OnCreate database ----------");
        // CREATING DATABASE
        try {
          final query = '''CREATE TABLE $_tableName (
           $_id INTEGER PRIMARY KEY AUTOINCREMENT,
           $_title TEXT NOT NULL,
           $_note TEXT,
           $_date TEXT,
           $_time TEXT
          )''';

          await db.execute(query);
          log("Database created ----------");
        } catch (e) {
          log("Failed to create database!!! -----------");
        }
      },
    );
    _database = myDb;
    return myDb;
  }

  //  READ FROM DATABASE
  Future<List<Map<String, Object?>>> readAllRecord() async {
    Database db = await database;
    final query = "SELECT * FROM $_tableName";

    try {
      final result = await db.rawQuery(query);
      log("Result: $result");
      return result;
    } catch (e) {
      log("Failed to fetch database ---------");
    }

    return [];
  }

  //  INSERT INTO DATABASE
  Future<void> insertRecord(NoteModel note) async {
    Database db = await database;
    List args = [note.title, note.note, note.date, note.time];
    final query = '''INSERT INTO $_tableName
    ($_title, $_note, $_date, $_time) 
    VALUES (?,?,?,?)''';

    try {
      final result = await db.rawInsert(query, args);
      log("Insert result: $result");
    } catch (e) {
      log("Failed to insert record ---------");
    }
  }

  //  DELETE INTO DATABASE
  Future<void> deleteRecord(int noteId) async {
    Database db = await database;
    final query = "DELETE FROM $_tableName WHERE $_id = $noteId";

    try {
      final result = await db.rawDelete(query);
      log("Delete result: $result");
    } catch (e) {
      log("Failed to delete record ---------");
    }
  }

  //  UPDATE INTO DATABASE
  Future<void> updateRecord(NoteModel note) async {
    Database db = await database;
    List args = [note.title, note.note, note.id];
    final query = '''UPDATE $_tableName SET 
    $_title = ?,
    $_note = ? WHERE $_id = ? 
    ''';

    try {
      final result = await db.rawUpdate(query, args);
      log("Update result: $result");
    } catch (e) {
      log("Failed to update record ---------");
    }
  }
}
