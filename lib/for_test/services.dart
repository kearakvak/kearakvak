// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testing4_for_flutter/for_test/people_model.dart';
import 'package:testing4_for_flutter/for_test/connection_db.dart';

import 'conatant.dart';

class ServicesData {
  late ConnectionDb _connectionDb;
  ServicesData() {
    _connectionDb = ConnectionDb();
  }
  static Database? _database;
  Future<Database?> get database async {
    // Restart Database ==================================
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, 'db_name');
    // await deleteDatabase(path);
    // debugPrint('Database Restarted');
    //==========================

    if (_database != null) {
      return _database;
    }
    _database = await _connectionDb.setDatabase();
    return _database;
  }

  insertPeople(PeopleModel data) async {
    var _con = await database;
    return await _con!.rawInsert(
      'INSERT INTO $tbPeople(name, gender,address,photo) VALUES(?, ?, ?, ?)',
      [data.name, data.gender, data.address, data.photo],
    );
  }

  selectPeople(table) async {
    var _con = await database;
    return await _con!.query(table);
  }

  deletePeople(table, id) async {
    var con = await database;
    return await con!.delete(table, where: "id = ?", whereArgs: [id]);
  }

  updatePeople(table, data, id) async {
    var con = await database;
    return await con!.update(table, data, where: "id= ?", whereArgs: [id]);
  }
}
