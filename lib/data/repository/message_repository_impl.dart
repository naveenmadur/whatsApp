// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/data/data_sources/message_remote_data_source.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource messageRemoteDataSource;
  MessageRepositoryImpl({
    required this.messageRemoteDataSource,
  });

  @override
  Future<Either<Failure, Stream<List<MessageEntity>>>> getMessage(
      String key) async {
    return await messageRemoteDataSource.getMessages(key);
  }

  @override
  Future<Either<Failure, void>> postMessage(
      {required MessageEntity message,
      required String receiverEmail,
      required String senderEmail}) async {
    return await messageRemoteDataSource.postMessage(
      message: message,
      senderEmail: senderEmail,
      receiverEmail: receiverEmail,
    );
  }
}
