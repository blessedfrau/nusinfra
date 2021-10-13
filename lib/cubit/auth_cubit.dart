// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nusantarainfra/model/auth_response.dart';
import 'package:nusantarainfra/model/login_credential.dart';
import 'package:nusantarainfra/services/auth_service.dart';

import '../service_locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> initLogin() async {
    print('initLogin');
    try {
      emit(AuthInProgress());
      bool success = await sl<AuthService>().autoLogin();

      if (success) {
        emit(AuthAutoLoginSuccess());
      }
    } catch (e) {
      print('initLogin error: $e');
      emit(const AuthFailure('Failed to initiate login'));
    }
  }

  Future<void> authenticate(String email, String password) async {
    try {
      emit(AuthInProgress());
      final AuthResponse response = await sl<AuthService>()
          .authenticate(LoginCredential(email: email, password: password));
      emit(AuthAuthenticationSuccess(response: response));
    } catch (e) {
      emit(AuthFailure('Failed authenticating $email'));
    }
  }

  Future<void> logout() async {
    print('logout');
    try {
      emit(AuthInProgress());
      bool success = await sl<AuthService>().logout();
      if (success) emit(AuthLogoutSuccess());
    } catch (e) {
      print('logout error: $e');
      emit(const AuthFailure('Failed to logout'));
    }
  }

  Future<void> changePhoto() async {
    try {} catch (e) {}
  }
}
