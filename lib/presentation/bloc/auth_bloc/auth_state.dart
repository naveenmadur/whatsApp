part of 'auth_bloc.dart';

enum AuthStatus { loading, success, failure }

abstract class AuthState {}

class AuthInitial extends AuthState {}

class CurrentState extends AuthState {
  final AuthStatus status;
  final String message, email;
  CurrentState({
    this.status = AuthStatus.loading,
    required this.message,
    required this.email,
  });
}
