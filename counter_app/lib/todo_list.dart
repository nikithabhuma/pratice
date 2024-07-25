import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/cubit/todo_cubit.dart';
import 'package:flutter_application_1/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(
                title: Text(todo.name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
