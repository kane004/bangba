import 'package:flutter/material.dart';

import 'Todo.dart';




class TodoWidget extends StatelessWidget {
  final Todo todo;

  TodoWidget({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text('User ID: ${todo.userId}, ID: ${todo.id}'),
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (bool? newValue) {
          // 处理复选框状态变化
        },
      ),
    );
  }
}


