import 'package:flutter/foundation.dart';
import 'package:todo/domain/entity/task.dart';

class TodoState {
  final List<Task> tasks;

  TodoState({
    required this.tasks,
  });

  TodoState copyWith({
    List<Task>? tasks,
  }) {
    return TodoState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  String toString() => 'TodoLoadSuccess(tasks: $tasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoState && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => tasks.hashCode;
}
