import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/todo_bloc.dart';
import 'package:todo/domain/bloc/todo_events.dart';
import 'package:todo/domain/bloc/todo_states.dart';
import 'package:todo/domain/entity/task.dart';

class TodoHomeView extends StatelessWidget {
  const TodoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO APP',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return ListRowWidget(
              task: state.tasks[index],
              index: index,
            );
          },
          itemCount: state.tasks.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addTask'),
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class ListRowWidget extends StatelessWidget {
  final Task task;
  final int index;
  const ListRowWidget({
    Key? key,
    required this.task,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: task.isCompleted
          ? GestureDetector(
              onTap: () => context
                  .read<TodoBloc>()
                  .add(TodoCompletedEvent(task: task, index: index)),
              child: const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 26,
              ),
            )
          : GestureDetector(
              onTap: () => context
                  .read<TodoBloc>()
                  .add(TodoCompletedEvent(task: task, index: index)),
              child: const Icon(Icons.radio_button_unchecked,
                  color: Colors.grey, size: 26),
            ),
      title: Text(task.name,
          style: task.isCompleted
              ? const TextStyle(color: Colors.grey, fontSize: 18)
              : const TextStyle(color: Colors.black, fontSize: 18)),
      trailing: task.isCompleted
          ? GestureDetector(
              onTap: () =>
                  context.read<TodoBloc>().add(TodoDeletedEvent(index)),
              child: const Icon(Icons.delete))
          : const SizedBox(
              width: 0,
            ),
    );
  }
}
