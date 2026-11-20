import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todos todos;

  const TodoWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${todos.id}'),
        ),
        title: Text(todos.title),
        subtitle: Text('User ID: ${todos.userId}'),
        trailing: Icon(
          todos.completed
              ? Icons.check_circle
              : Icons.cancel,
          color: todos.completed
              ? Colors.green
              : Colors.red,
        ),
      ),
    );
  }
}