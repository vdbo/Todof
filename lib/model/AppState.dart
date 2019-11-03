import 'package:scoped_model/scoped_model.dart';

class AppState extends Model {
  List<String> _todoItems = ["eat", "rave", "sleep", "repeat"];

  void addTodo(String value) {
    _todoItems.add(value);
    notifyListeners();
  }

  List<String> get todos {
    return _todoItems;
  }
}
