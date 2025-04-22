import 'package:chat_app/chat_page.dart';
import 'package:chat_app/core/theme.dart';
import 'package:chat_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:chat_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:chat_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/pages/login_page.dart';
import 'package:chat_app/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  final authRepoImpl = AuthRepoImpl(AuthRemoteDataSource());
  runApp(MyApp(
    authRepoImp: authRepoImpl,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepoImpl authRepoImp;
  const MyApp({super.key, required this.authRepoImp});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
              registerUseCase: RegisterUseCase(repository: authRepoImp),
              loginUseCase: LoginUseCase(repository: authRepoImp)),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        home: const RegisterPage(),
        routes: {
          "/login": (_) => const LoginPage(),
          "/register": (_) => const RegisterPage(),
          "/chatPage": (_) => const ChatPage()
        },
      ),
    );
  }
}
