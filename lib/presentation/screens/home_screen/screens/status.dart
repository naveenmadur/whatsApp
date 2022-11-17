import 'package:flutter/material.dart';
import 'package:whats_app/constants/text_styles.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Status Screen',
          style: TextStyles.homescreenAppBarTextStyle,
        ),
      ),
    );
  }
}
