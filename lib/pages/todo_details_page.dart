import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo.dart';

class TodoDetailsPage extends StatelessWidget {
  const TodoDetailsPage({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory App"),
        toolbarHeight: 70,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(10),
      child: Text(todo.description),),
    );
  }
}