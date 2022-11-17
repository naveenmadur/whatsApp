import 'package:flutter/material.dart';
import 'package:whats_app/constants/text_styles.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Chats Screen',
          style: TextStyles.homescreenAppBarTextStyle,
        ),
      ),
    );
  }
}
