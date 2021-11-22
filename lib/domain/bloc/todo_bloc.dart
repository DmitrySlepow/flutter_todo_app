import 'package:bloc/bloc.dart';
import 'package:todo/domain/bloc/todo_events.dart';
import 'package:todo/domain/bloc/todo_states.dart';
import 'package:todo/domain/data_providers/todo_data_provider.dart';
import 'package:todo/domain/entity/task.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoDataProvider provider = TodoDataProvider();

  TodoBloc() : super(TodoState(tasks: [])) {
    on<TodoLoadedEvent>((event, emit) async {
      List<Task> tasks = await provider.loadTodos();
      emit(TodoState(tasks: tasks));
    });
    on<TodoAddedEvent>((event, emit) async {
      await provider.addTask(event.task);
      List<Task> tasks = await provider.loadTodos();
      emit(TodoState(tasks: tasks));
    });
    on<TodoDeletedEvent>((event, emit) async {
      await provider.deleteTask(event.index);
      List<Task> tasks = await provider.loadTodos();
      emit(TodoState(tasks: tasks));
    });
    on<TodoCompletedEvent>((event, emit) async {
      await provider.updateTask(event.task, event.index);
      List<Task> tasks = await provider.loadTodos();
      emit(TodoState(tasks: tasks));
    });
    add(TodoLoadedEvent());
  }
}
