import 'package:chat_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);
  @override
  Future<UserEntity> login(String email, String password) async {
    return await authRemoteDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register(
      String userName, String email, String password) async {
    return await authRemoteDataSource.register(
        username: userName, email: email, password: password);
  }
}
