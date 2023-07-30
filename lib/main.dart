import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initAppModule();

  runApp(ProviderScope(child: MyApp()));
}
