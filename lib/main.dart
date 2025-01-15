import 'package:chat_app/presentation/home/splash_screen.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:chat_app/presentation/provider/record_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => RecordProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ChatProvider(),
      ),
    ], child: MaterialApp(theme: ThemeData(), home: const SplashScreen()));
  }
}
