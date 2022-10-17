import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testing4_for_flutter/for_test/conatant.dart';

class ConnectionDb {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'my_db');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
    return database;
  }

  _onCreateDatabase(Database database, int version) async {
    await database.execute(
      'CREATE TABLE $tbPeople(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, gender TEXT,address TEXT,photo TEXT)',
    );
  }
}
