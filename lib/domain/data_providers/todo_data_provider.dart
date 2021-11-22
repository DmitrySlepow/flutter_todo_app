import 'package:hive/hive.dart';
import 'package:todo/domain/entity/task.dart';

class TodoDataProvider {
  Future<List<Task>> loadTodos() async {
    final box = await Hive.openBox<Task>('todos');
    List<Task> tasks = box.values.toList();
    return tasks;
  }

  Future<void> addTask(Task task) async {
    final box = await Hive.openBox<Task>('todos');
    box.add(task);
  }

  Future<void> deleteTask(int index) async {
    final box = await Hive.openBox<Task>('todos');
    box.deleteAt(index);
  }

  Future<void> updateTask(Task task, int index) async {
    final box = await Hive.openBox<Task>('todos');
    task = task.copyWith(name: task.name, isCompleted: !task.isCompleted);
    box.putAt(index, task);
  }
}
