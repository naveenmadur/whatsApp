import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/entities.dart';

//! contract
abstract class AuthRepository {
  Future<Either<Failure, WhatsUpUser>> login(String email, String password);
  Future<Either<Failure, WhatsUpUser>> signup(String email, String password);
}
