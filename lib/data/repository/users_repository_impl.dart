import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/data/data_sources/users_remote_data_source.dart';
import 'package:whats_app/data/model/user_model.dart';
import 'package:whats_app/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource usersRemoteDataSource;
  UsersRepositoryImpl({required this.usersRemoteDataSource});
  @override
  Future<Either<Failure, Stream<List<UserModel>>>> getAllUsers() async {
    try {
      final  users = await usersRemoteDataSource.fetchUsers();
      return Right(users);
    } catch (e) {
      return Left(FirebaseFailure('Error fetching users'));
    }
  }
}
