import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  const AuthInputField(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller,
      this.isPassword = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: DefaultColors.sentMessageInput,
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          kWidth(10),
          Expanded(
              child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none),
          )),
        ],
      ),
    );
  }
}
