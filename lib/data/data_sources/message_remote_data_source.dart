import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whats_app/core/errors/failure.dart';
import 'package:whats_app/data/model/message_model.dart';
import 'package:whats_app/domain/entities/message_entity.dart';

abstract class MessageRemoteDataSource {
  Future<Either<Failure, Stream<List<MessageEntity>>>> getMessages(String key);
  Future<Either<Failure, void>> postMessage({
    required MessageEntity message,
    required String senderEmail,
    required String receiverEmail,
  });
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('chats');
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<Either<Failure, Stream<List<MessageEntity>>>> getMessages(
      String key) async {
    try {
      var data = await chatCollection
          .doc(key)
          .collection('messages')
          .orderBy('createdTime', descending: true)
          .snapshots();

      final dataList = data.map((event) =>
          event.docs.map((e) => MessageModel.fromJson(e.data())).toList());

      return Right(dataList);
    } catch (e) {
      return Left(DatabaseFailure('Cannot Fetch Messages...'));
    }
  }

  @override
  Future<Either<Failure, void>> postMessage({
    required MessageEntity message,
    required String senderEmail,
    required String receiverEmail,
  }) async {
    try {
      // String senderId = senderEmail.split('_').first;
      // String receiverId = senderEmail.split('_').last;
      // await usersCollection.doc(senderKey).set({
      //   "groups": [
      //     {
      //       'senderId': message.senderId,
      //       'receiverId': message.receiverId,
      //       'message': message.message,
      //       'createdTime': message.createdTime,
      //       'isRead': message.isRead,
      //     }
      //   ]
      // });
      await usersCollection.doc(senderEmail).collection(receiverEmail).add({
        'senderId': message.senderId,
        'receiverId': message.receiverId,
        'message': message.message,
        'createdTime': message.createdTime,
        'isRead': message.isRead,
      });

      
      await usersCollection.doc(receiverEmail).collection(senderEmail).add({
        'senderId': message.senderId,
        'receiverId': message.receiverId,
        'message': message.message,
        'createdTime': message.createdTime,
        'isRead': message.isRead,
      });

      // chatCollection.doc(key).collection('messages').add({
      //   'senderId': message.senderId,
      //   'receiverId': message.receiverId,
      //   'message': message.message,
      //   'createdTime': message.createdTime,
      //   'isRead': message.isRead,
      // });
      return Right(Void);
    } catch (e) {
      return Left(DatabaseFailure('Unable to post message'));
    }
  }
}
