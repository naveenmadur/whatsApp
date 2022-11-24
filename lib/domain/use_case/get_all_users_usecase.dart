import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/user_entity.dart';
import 'package:whats_app/domain/repositories/users_repository.dart';

class GetAllUsersUseCase {
  final UsersRepository repo;
  GetAllUsersUseCase({required this.repo});

  Future<Either<Failure, Stream<List<UserEntity>>>> getAllUsers() async {
    return await repo.getAllUsers();
  }
}
