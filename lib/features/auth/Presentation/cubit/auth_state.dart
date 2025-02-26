import 'package:firebase_auth/firebase_auth.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final User user;

  AuthLoaded({required this.user});
}

class Unauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
