// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/repositories/message_repository.dart';

class GetMessageUseCase {
  final MessageRepository repo;
  GetMessageUseCase({
    required this.repo,
  });
  Future<Either<Failure, Stream<List<MessageEntity>>>> getMessages(
      String key) async {
    return await repo.getMessage(key);
  }
}
