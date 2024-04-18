// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do-app!!!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My first To-do-list app!"),
      ),
      body: Column(
        children: [
          Progress(),
          TaskList(),
        ],
      )
      );
  }
}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("This is your percentage of completion"),
        LinearProgressIndicator(value: 1.0),
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(label: "kjljaf"),
        TaskItem(label: "akjsdfla"),
        TaskItem(label: "akslfdj"),
      ]
    );
  }
}

class TaskItem extends StatelessWidget {
  final String label;
  const TaskItem({required this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(onChanged: null, value: true),
        Text(label),
      ],
      );
  }
}