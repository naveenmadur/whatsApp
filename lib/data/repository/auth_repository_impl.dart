import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/data/data_sources/auth_remote_data_source.dart';
import 'package:whats_app/domain/entities/entities.dart';
import 'package:whats_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, WhatsUpUserEntity>> signup(
      String email, String password) async {
    return authRemoteDataSource.register(email, password);
  }

  @override
  Future<Either<Failure, WhatsUpUserEntity>> login(
      String email, String password) async {
    return authRemoteDataSource.login(email, password);
  }

  @override
  Future<Either<Failure, WhatsUpUserEntity>> currentUser() async {
    final WhatsUpUserEntity user = await authRemoteDataSource.currentUser();
    return Right(user);
  }
}
