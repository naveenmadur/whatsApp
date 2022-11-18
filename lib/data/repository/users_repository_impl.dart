// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/data/data_sources/users_remote_data_source.dart';
import 'package:whats_app/domain/entities/user_entity.dart';
import 'package:whats_app/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource usersRemoteDataSource;
  UsersRepositoryImpl({required this.usersRemoteDataSource});
  @override
  Future<Either<Failure, Stream<QuerySnapshot>?>> getAllUsers() async {
    try {
      final  users = await usersRemoteDataSource.fetchUsers();
      return Right(users);
    } catch (e) {
      return Left(FirebaseFailure('Error fetching users'));
    }
  }
}
