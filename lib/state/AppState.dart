import 'package:scoped_model/scoped_model.dart';
import 'package:todof/data/model/Task.dart';
import 'package:todof/data/source/DatabaseCreator.dart';
import 'package:todof/data/source/TaskLocalSource.dart';

class AppState extends Model {
  TaskLocalSource _taskLocalSource;
  List<Task> _todos = [];

  AppState() {
    _init();
  }

  Future _init() async {
    _taskLocalSource = TaskLocalSource(await DatabaseCreator.create("todo.db"));
    _todos = await _taskLocalSource.get();
    notifyListeners();
  }

  List<Task> get todos => _todos;

  Future<void> addTodo(Task task) async {
    await _taskLocalSource.add(task);
    _todos = await _taskLocalSource.get();
    notifyListeners();
  }
}
