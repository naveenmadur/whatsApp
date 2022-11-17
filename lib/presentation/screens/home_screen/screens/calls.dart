import 'package:flutter/material.dart';
import 'package:whats_app/constants/text_styles.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Calls Screen',
          style: TextStyles.homescreenAppBarTextStyle,
        ),
      ),
    );
  }
}
