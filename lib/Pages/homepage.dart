import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/utils/diaglog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _myBox = Hive.box("myBox");
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void chechboxchanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] =
          !db.toDoList[index][1]; // Update the completion status
      // This function will be used to update the state of the todo list
      // when a checkbox is changed.
    });
    db.updatedata();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedata();
  }

  void createdNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
        // This function will be used to create a new task dialog box.
        // It will show a dialog box where the user can enter a new task.
      },
    );
    db.updatedata();
  }

  void deletetask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Center(child: Text("Todo App")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createdNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) {
              chechboxchanged(value, index);
            },
            deletefunction: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
