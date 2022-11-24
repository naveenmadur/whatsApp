import 'package:whats_app/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel(
      {required super.message,
      required super.createdTime,
      required super.senderId,
      required super.receiverId});

  @override
  List<Object?> get props => [message, createdTime, senderId, receiverId];

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      createdTime: json['createdTime'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'message': message,
      'createdTime': createdTime,
      'senderId': senderId,
      'receiverId': receiverId,
    };
    return map;
  }
}
