// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email, password;
  RegisterEvent({
    required this.email,
    required this.password,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class GetCurrentUser extends AuthEvent{}
