import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repo.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase({required this.repository});
  Future<UserEntity> call(String username, String email, String password) {
    return repository.register(username, email, password);
  }
}
