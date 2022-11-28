class MessageEntity {
  final String message;
  final String createdTime;
  final bool isRead;
  final String senderId;
  final String receiverId;
  MessageEntity({
    required this.message,
    required this.createdTime,
    required this.isRead,
    required this.senderId,
    required this.receiverId,
  });
}
