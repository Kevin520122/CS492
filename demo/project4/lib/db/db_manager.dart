import 'dart:async';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';

class DatabaseManager {
  // ignore: non_constant_identifier_names
  static const String DB_NAME = 'journal.sqlite3.db';
  static const CREATE_FILE_PATH = 'assets/schema_1.sql.txt';

  //Select sql
  static const SELECT = 'SELECT * FROM journal_entries';
  //Insert sql
  static const INSERT =
      'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)';

  static late DatabaseManager _instance;
  late final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    // ignore: unnecessary_null_comparison
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    print(1);
    //await deleteDatabase("journal.sqlite3.db");
    //Load create sql
    // ignore: non_constant_identifier_names
    String SQL_CREATE = await rootBundle.loadString(CREATE_FILE_PATH);
    final db = await openDatabase(DB_NAME, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(SQL_CREATE);
    });
    print(2);
    _instance = DatabaseManager._(database: db);
  }

  void save({entry}) {
    db.transaction((txn) async {
      await txn.rawInsert(
          INSERT, [entry.title, entry.body, entry.rating, entry.date]);
    });
  }

  Future<List<journalEntry>> getEntries() async {
    List<Map> journalRecords = await db.rawQuery(SELECT);
    final journalEntries = journalRecords.map((entry) {
      return journalEntry(
          title: entry['title'],
          body: entry['body'],
          rating: entry['rating'],
          date: entry['date']);
    }).toList();

    return journalEntries;
  }
}
