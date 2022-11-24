// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'message_bloc.dart';

abstract class MessageEvent {
  const MessageEvent();
}

class GetMessageEvent extends MessageEvent {
  final String key;
  GetMessageEvent({
    required this.key,
  });
}

class PostMessageEvent extends MessageEvent {
  final MessageEntity message;
  final String key;

  PostMessageEvent({
    required this.message,
    required this.key,
  });
}
