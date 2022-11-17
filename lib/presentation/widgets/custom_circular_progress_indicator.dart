import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorConstants.primary_green,
      ),
    );
  }
}
