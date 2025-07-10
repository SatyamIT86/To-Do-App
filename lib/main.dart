import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/Pages/homepage.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("myBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Optional: hides
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
