import 'package:chat_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/features/auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthInputField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: emailController,
                  isPassword: false),
              AuthInputField(
                  hint: "Password",
                  icon: Icons.password,
                  controller: passwordController,
                  isPassword: true),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return AuthButton(title: "Login", onPressed: _onLogin);
                },
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamed(context, "/chatPage");
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
              ),
              LoginPrompt(
                title: "Don't have an account ? ",
                content: "Register",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
