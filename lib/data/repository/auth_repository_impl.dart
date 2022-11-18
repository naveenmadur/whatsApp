import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/data/data_sources/auth_remote_data_source.dart';
import 'package:whats_app/domain/entities/entities.dart';
import 'package:whats_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, WhatsUpUserEntity>> signup(String email, String password) async {
    try {
      authRemoteDataSource.register(email, password);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
    return await Right(WhatsUpUserEntity(email: email));
  }

  @override
  Future<Either<Failure, WhatsUpUserEntity>> login(String email, String password) async {
    try {
      authRemoteDataSource.login(email, password);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
    return Right(WhatsUpUserEntity(email: email));
  }
  
  @override
  Future<Either<Failure, WhatsUpUserEntity>> currentUser() async {
    final WhatsUpUserEntity user = await authRemoteDataSource.currentUser();
    return  Right(user);
  }
}
