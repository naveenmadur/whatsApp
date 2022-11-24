// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String message;
  final String createdTime;
  final String senderId;
  final String receiverId;
  MessageEntity({
    required this.message,
    required this.createdTime,
    required this.senderId,
    required this.receiverId,
  });

  @override
  List<Object?> get props => [];
}
