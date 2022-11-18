// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/user_entity.dart';
import 'package:whats_app/domain/repositories/users_repository.dart';

class GetAllUsersUseCase {
  final UsersRepository repo;
  GetAllUsersUseCase({required this.repo});

  Future<Either<Failure, Stream<QuerySnapshot>?>> getAllUsers() async {
    return await repo.getAllUsers();
  }
}
