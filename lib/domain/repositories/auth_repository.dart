import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/entities.dart';

//! contract
abstract class AuthRepository {
  Future<Either<Failure, WhatsUpUserEntity>> login(String email, String password);
  Future<Either<Failure, WhatsUpUserEntity>> signup(String email, String password);
  Future<Either<Failure, WhatsUpUserEntity>> currentUser();
}
