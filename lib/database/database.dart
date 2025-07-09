import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box("myBox");
  void createInitialData() {
    toDoList = [
      ["Do code", false],
    ];
  }

  void loaddata() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updatedata() {}
}
