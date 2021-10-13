import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String token;
  final User user;

  AuthResponse({required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  @override
  String toString() {
    return 'AuthResponse[token: $token]';
  }
}

@JsonSerializable()
class User {
  int id;
  String name, avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User[avatar: $avatar]';
  }
}
