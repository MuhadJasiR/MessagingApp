import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTextInput("Username", Icons.person, usernameController),
              _buildTextInput("Email", Icons.mail, emailController),
              _buildTextInput("Password", Icons.password, passwordController,
                  isPassword: true),
              _buildRegisterButton(),
              _buildLoginPrompt()
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildLoginPrompt() {
    return GestureDetector(
      onTap: () {},
      child: RichText(
          text: const TextSpan(
              text: "Already have an account ? ",
              style: TextStyle(color: Colors.grey),
              children: [
            TextSpan(
                text: "Click here to login",
                style: TextStyle(color: Colors.blue))
          ])),
    );
  }

  ElevatedButton _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 30),
          backgroundColor: DefaultColors.buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.symmetric(vertical: 15)),
      child: const Text(
        "Register",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Container _buildTextInput(
      String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
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
