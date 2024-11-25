part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

// Login
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String role;

  LoginSuccess({required this.role});
}

class LoginFailure extends AuthState {}

class SignupImagePicked extends AuthState {}

// Signup
class SignUpLoading extends AuthState {}

class SignUpFailure extends AuthState {}

class SignUpSuccess extends AuthState {}
