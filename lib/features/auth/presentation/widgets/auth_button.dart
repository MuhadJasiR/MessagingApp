import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  void Function()? onPressed;
  final String title;
  AuthButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 30),
          backgroundColor: DefaultColors.buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.symmetric(vertical: 15)),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
