import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/features/todo/todo_view.dart';

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: 'Todo App',
      home: TodoView(),
    );
  }
}
