import 'package:sqflite/sqflite.dart';
import 'package:todof/data/model/Task.dart';

class TaskLocalSource {
  static String createTable = "CREATE TABLE $tableName("
      "id INTEGER PRIMARY KEY, "
      "title TEXT, "
      "description TEXT, "
      "isActive INTEGER, "
      "isCompleted INTEGER)";
  static String tableName = "task";

  final Database _storage;

  TaskLocalSource(this._storage);

  Future<List<Task>> get() async {
    var values = await _storage.query(tableName);
    return Future.value(
      values.map<Task>((taskValues) => _Converters.toTask(taskValues)).toList(),
    );
  }

  Future<void> add(Task task) async {
    await _storage.insert(
      tableName,
      _Converters.toMap(task),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

class _Converters {
  static Map<String, dynamic> toMap(Task task) => {
        //'id': task.id,
        'title': task.title,
        'description': task.description,
        'isActive': task.isActive ? 1 : 0,
        'isCompleted': task.isCompleted ? 1 : 0,
      };

  static toTask(Map<String, dynamic> values) => Task(
        values['title'],
        values['description'],
        values['isActive'] == 1,
        values['isCompleted'] == 1,
        values['id'],
      );
}
