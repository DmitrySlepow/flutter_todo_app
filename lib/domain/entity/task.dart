import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isCompleted;
  Task({
    required this.name,
    required this.isCompleted,
  });

  Task copyWith({
    String? name,
    bool? isCompleted,
  }) {
    return Task(
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() => 'Task(name: $name, isCompleted: $isCompleted)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.name == name &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => name.hashCode ^ isCompleted.hashCode;
}
