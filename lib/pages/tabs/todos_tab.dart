import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/todo_widget.dart';

class TodosTab extends StatelessWidget {
  const TodosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: ApiService.fetchTodos,
      itemBuilder: (context, todos, index) {
        return TodoWidget(todos: todos);
      },
      title: 'Todos',
    );
  }
}