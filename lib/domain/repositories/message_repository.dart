import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<Either<Failure, Stream<List<MessageEntity>>>> getMessage(String key);
  Future<Either<Failure, void>> postMessage(
      {required MessageEntity message, required String key});
}
