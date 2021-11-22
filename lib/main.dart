import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo/domain/bloc/todo_bloc.dart';
import 'package:todo/ui/todo_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'domain/entity/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(BlocProvider(
    create: (_) => TodoBloc(),
    child: const TodoApp(),
  ));
}
