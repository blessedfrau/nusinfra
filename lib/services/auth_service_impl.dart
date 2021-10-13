import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusantarainfra/model/auth_response.dart';
import 'package:nusantarainfra/model/login_credential.dart';
import 'package:nusantarainfra/utils/constants.dart';
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final Dio dio;
  final FlutterSecureStorage storage;

  AuthServiceImpl({
    required this.dio,
    required this.storage,
  });

  @override
  Future<AuthResponse> authenticate(LoginCredential credential) async {
    AuthResponse authResponse;
    try {
      final response = await dio.post('/login', data: credential.toJson());

      authResponse = AuthResponse.fromJson(response.data);
      await saveAuthData(AuthKey.token, authResponse.token);
      await saveAuthData(AuthKey.email, credential.email);
      await saveAuthData(AuthKey.password, credential.password);
    } on DioError catch (e) {
      throw e.error;
    }

    return authResponse;
  }

  Future<void> saveAuthData(AuthKey key, String data) async {
    await storage.write(key: key.toString(), value: data);
  }

  @override
  Future<bool> autoLogin() async {
    bool success = true;
    final String email = await getAuthData(AuthKey.email);
    final String password = await getAuthData(AuthKey.password);

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await authenticate(LoginCredential(email: email, password: password));
      } catch (e) {
        success = false;
      }
    } else {
      success = false;
    }
    return success;
  }

  Future<String> getAuthData(AuthKey key) async {
    var data = await storage.read(key: key.toString());
    return data.toString();
  }

  @override
  Future<bool> logout() async {
    await storage.deleteAll();
    return true;
  }
}
