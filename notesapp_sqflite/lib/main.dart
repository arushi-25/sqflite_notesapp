import 'package:flutter/material.dart';
import 'package:notesapp_sqflite/screens/note_detail.dart';
import 'package:notesapp_sqflite/screens/note_list.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notekeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: NoteList(),
    );
  }
}