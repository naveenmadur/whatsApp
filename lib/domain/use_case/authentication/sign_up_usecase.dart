import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/entities.dart';
import 'package:whats_app/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository auth;
  SignupUseCase({required this.auth});

  Future<Either<Failure, WhatsUpUser>> registerUser({required String email, required String password}) {
    return auth.signup(email, password);
  }
}
