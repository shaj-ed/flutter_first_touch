
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/pages/todo_details_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key, required this.todos});
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            Text("Total ${todos.length}"),
            Expanded(
              child :ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todos[index].title),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => TodoDetailsPage(todo: todos[index])
                            )
                        );
                      }
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}