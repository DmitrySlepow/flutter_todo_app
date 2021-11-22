import 'package:todo/domain/entity/task.dart';

abstract class TodoEvent {}

class TodoLoadedEvent extends TodoEvent {}

class TodoAddedEvent extends TodoEvent {
  final Task task;

  TodoAddedEvent(this.task);
}

class TodoDeletedEvent extends TodoEvent {
  final int index;

  TodoDeletedEvent(this.index);
}

class TodoCompletedEvent extends TodoEvent {
  final Task task;
  final int index;
  TodoCompletedEvent({
    required this.index,
    required this.task,
  });
}
