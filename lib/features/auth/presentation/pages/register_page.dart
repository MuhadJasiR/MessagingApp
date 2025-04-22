import 'package:chat_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_app/features/auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text));
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
                  hint: "Username",
                  icon: Icons.person,
                  controller: usernameController),
              AuthInputField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: emailController),
              AuthInputField(
                hint: "Password",
                icon: Icons.password,
                controller: passwordController,
                isPassword: true,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return AuthButton(title: "Register", onPressed: _onRegister);
                },
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamed(context, "/login");
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
              ),
              LoginPrompt(
                title: 'Already have an account ? ',
                content: 'Click here to login',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
