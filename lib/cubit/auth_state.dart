part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthAuthenticationSuccess extends AuthState {
  final AuthResponse response;

  const AuthAuthenticationSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class AuthAutoLoginSuccess extends AuthState {}

class AuthInProgress extends AuthState {}

class AuthLogoutSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}
