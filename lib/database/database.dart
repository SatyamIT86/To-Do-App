import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.openBox("myBox");
  void createInitialData() {
    toDoList = [
      ["Do code", false],
    ];
  }

  void loaddata() {}
  void updatedata() {}
}
