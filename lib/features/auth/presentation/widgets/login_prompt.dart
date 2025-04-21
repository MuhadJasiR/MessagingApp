import 'package:flutter/material.dart';

class LoginPrompt extends StatelessWidget {
  LoginPrompt(
      {super.key,
      required this.title,
      required this.content,
      required this.onTap});

  final String title;
  final String content;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(color: Colors.grey),
              children: [
            TextSpan(text: content, style: const TextStyle(color: Colors.blue))
          ])),
    );
  }
}
