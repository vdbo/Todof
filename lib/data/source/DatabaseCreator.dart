import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todof/data/source/TaskLocalSource.dart';

class DatabaseCreator {
  DatabaseCreator._();

  static Future<Database> create(String name) async {
    return openDatabase(
      join(await getDatabasesPath(), name),
      onCreate: (db, version) {
        return db.execute(TaskLocalSource.createTable);
      },
      version: 1,
    );
  }
}
