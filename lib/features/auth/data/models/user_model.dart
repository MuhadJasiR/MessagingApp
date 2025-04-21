import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.id,
      required super.username,
      required super.token});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"],
        id: json["id"],
        username: json["username"],
        token: json["token"]);
  }
}
