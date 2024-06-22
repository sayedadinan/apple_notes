import 'dart:developer';

import 'package:apple_notes/data/modal/note_modal.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DataStorage {
  createTable(sql.Database datebase) async {
    await datebase.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY,title TEXT,notes TEXT, date String)');
  }

  Future<sql.Database> db() async {
    return sql.openDatabase('data.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  insertData(NoteModel noteModel) async {
    log('worked');
    try {
      sql.Database database = await db();
      log('done');
      return database.insert(
        'note',
        noteModel.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
    } catch (e) {
      return log(e.toString());
    }
  }

  getAllData() async {
    sql.Database database = await db();
    return database.query('note', orderBy: "id");
  }

  updateData(NoteModel noteModel) async {
    try {
      sql.Database database = await db();
      return await database.update(
        'note',
        noteModel.toMap(),
        where: 'id = ?',
        whereArgs: [noteModel.id],
      );
    } catch (e) {
      return log(e.toString());
    }
  }

  Future<int> deleteData(int id) async {
    try {
      sql.Database database = await db();
      int rowsDeleted = await database.delete(
        'note',
        where: 'id = ?',
        whereArgs: [id],
      );
      log('Deleted $rowsDeleted rows with ID: $id');
      return rowsDeleted;
    } catch (e) {
      log('Error deleting note: ${e.toString()}');
      return -1;
    }
  }

  searchData(String keyword) async {
    try {
      sql.Database database = await db();
      return await database.query(
        'note',
        where: 'title LIKE ? OR notes LIKE ?',
        whereArgs: ['%$keyword%', '%$keyword%'],
        orderBy: "id",
      );
    } catch (e) {
      log('Error searching notes: ${e.toString()}');
      return [];
    }
  }
}
