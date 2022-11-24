// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whats_app/constants/decorations.dart';
import 'package:whats_app/domain/entities/message_entity.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.receiver,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  final bool receiver;
  final AsyncSnapshot<List<MessageEntity>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: receiver
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 200),
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(
            horizontal: 15, vertical: 10),
        decoration: Decorations.chatDecoration(receiver),
        child: Text(
          snapshot.data![index].message,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
