import 'dart:convert';

class UserEntity {
  final String username;
  final String email;
  final String password;
  UserEntity({
    required this.username,
    required this.email,
    required this.password,
  });

  UserEntity copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return UserEntity(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserEntity(username: $username, email: $email, password: $password)';

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ password.hashCode;
}
