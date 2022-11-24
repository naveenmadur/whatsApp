part of 'message_bloc.dart';

abstract class MessageState {
  const MessageState();
}

class MessageInitial extends MessageState {}

class AllMessages extends MessageState {
  final Stream<List<MessageEntity>> messages;
  AllMessages({
    required this.messages,
  });
}

class ErrorState extends MessageState {
  final String message;

  ErrorState(this.message);
}
