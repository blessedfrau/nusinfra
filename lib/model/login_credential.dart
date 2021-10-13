import 'package:json_annotation/json_annotation.dart';
part 'login_credential.g.dart';

@JsonSerializable()
class LoginCredential {
  final String email;
  final String password;

  LoginCredential({
    required this.email,
    required this.password,
  });

  factory LoginCredential.fromJson(Map<String, dynamic> json) =>
      _$LoginCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCredentialToJson(this);

  @override
  String toString() {
    return 'LoginCredential[email: $email, password: $password]';
  }
}
