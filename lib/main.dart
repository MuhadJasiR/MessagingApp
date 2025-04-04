import 'package:chat_app/chat_page.dart';
import 'package:chat_app/core/theme.dart';
import 'package:chat_app/message_page.dart';
import 'package:chat_app/presentation/home/home_screen.dart';
import 'package:chat_app/register_page.dart';
import 'package:chat_app/sample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: RegisterPage(),
    );
  }
}
