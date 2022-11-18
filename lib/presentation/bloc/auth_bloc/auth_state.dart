// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class UserDetails extends AuthState {
  final WhatsUpUserEntity user;
  UserDetails({
    required this.user,
  });
}
