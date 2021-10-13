import 'package:dio/dio.dart';
import 'package:nusantarainfra/model/auth_response.dart';
import 'package:nusantarainfra/model/login_credential.dart';

abstract class AuthService {
  Future<AuthResponse> authenticate(LoginCredential credential);
  Future<bool> autoLogin();
  Future<bool> logout();
}
