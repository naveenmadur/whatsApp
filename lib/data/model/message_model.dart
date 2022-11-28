import 'package:whats_app/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.message,
    required super.createdTime,
    required super.senderId,
    required super.receiverId,
    required super.isRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      createdTime: json['createdTime'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      isRead: json['isRead'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'message': message,
      'createdTime': createdTime,
      'senderId': senderId,
      'receiverId': receiverId,
      'isRead': isRead,
    };
    return map;
  }
}
