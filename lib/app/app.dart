import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/reservation_kiosk.dart';
import 'package:q_pal_kiosk_app/features/todo/todo.dart';

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: 'Todo App',
      home: ReservationKioskView(),
    );
  }
}
