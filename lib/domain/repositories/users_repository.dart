import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/data/model/user_model.dart';

abstract class UsersRepository{
  Future<Either<Failure,Stream<List<UserModel>>>> getAllUsers();
}