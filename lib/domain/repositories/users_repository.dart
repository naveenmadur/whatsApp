import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/user_entity.dart';

abstract class UsersRepository{
  Future<Either<Failure,Stream<QuerySnapshot>?>> getAllUsers();
}