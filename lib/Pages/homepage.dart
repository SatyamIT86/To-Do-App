import 'package:flutter/material.dart';
import 'package:todo_app/utils/diaglog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();
  List toDoList = [
    ["Do Code", false],
    ["Do Activities", false],
    ["Do marketing", false],
    ["Do Flutter", true],
    ["Do Learn Something new", true],
  ];
  void chechboxchanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1]; // Update the completion status
      // This function will be used to update the state of the todo list
      // when a checkbox is changed.
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text("Todo App"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createdNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) {
              chechboxchanged(value, index);
            },
          );
        },
      ),
    );
  }
}
