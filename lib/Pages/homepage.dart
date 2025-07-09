import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text("Todo App"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          TodoTile(
            taskName: "Do Code",
            taskCompleted: true,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
          TodoTile(
            taskName: "Do Activities",
            taskCompleted: false,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
          TodoTile(
            taskName: "Do marketing",
            taskCompleted: false,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
          TodoTile(
            taskName: "Do Flutter",
            taskCompleted: true,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
          TodoTile(
            taskName: "Do Learn Something new",
            taskCompleted: true,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
          TodoTile(
            taskName: "Do Learn Something new",
            taskCompleted: false,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
          TodoTile(
            taskName: "Do Learn Something new",
            taskCompleted: true,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
          TodoTile(
            taskName: "Do Learn Something new",
            taskCompleted: true,
            onChanged: (value) {
              setState(() {
                // Handle checkbox state change
              });
            },
          ),
        ],
      ),
    );
  }
}
