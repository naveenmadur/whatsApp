// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/entities.dart';
import 'package:whats_app/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository auth;
  LoginUseCase({required this.auth});

  Future<Either<Failure, WhatsUpUser>> login({
    required String email,
    required String password,
  }) {
    return auth.login(email, password);
  }
}
