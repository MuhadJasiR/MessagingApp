import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase({required this.repository});
  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
