class UserEntity {
  final String id;
  final String email;
  final String username;
  final String token;
  UserEntity(
      {required this.email,
      required this.id,
      required this.username,
      this.token = ""});
}
