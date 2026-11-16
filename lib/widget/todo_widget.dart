import 'package:flutter/cupertino.dart';
import 'package:jsonplaceholder/model/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todos todos;
  const TodoWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}