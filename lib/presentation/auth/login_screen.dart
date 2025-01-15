import 'package:chat_app/presentation/auth/widget/auth_field.dart';
import 'package:chat_app/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == 'admin' &&
          _passwordController.text == 'password') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('username', _usernameController.text);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login In.",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                AuthField(
                    hintText: "Full Name", controller: _usernameController),
                const SizedBox(height: 15),
                AuthField(
                  hintText: "Password",
                  controller: _passwordController,
                  obscure: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      login();
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: const Text("login")),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                        TextSpan(
                            text: "Sign In",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold))
                      ])),
                )
              ],
            ),
          )),
    );
  }
}
