import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todos todos;

  const TodoWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    final isCompleted = todos.completed;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.deepPurple.shade50,
          child: Text(
            '${todos.id}',
            style: TextStyle(
              color: Colors.deepPurple.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),

        title: Text(
          todos.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
            height: 1.4,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Icon(
                Icons.person_outline,
                size: 15,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 4),
              Text(
                'User ${todos.userId}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isCompleted
                      ? Colors.green.shade50
                      : Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isCompleted ? 'Completed' : 'Pending',
                  style: TextStyle(
                    color: isCompleted
                        ? Colors.green.shade700
                        : Colors.orange.shade800,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        trailing: Icon(
          isCompleted
              ? Icons.check_circle_rounded
              : Icons.pending_actions_rounded,
          color: isCompleted ? Colors.green : Colors.orange,
          size: 25,
        ),
      ),
    );
  }
}