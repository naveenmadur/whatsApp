// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whats_app/constants/color_constants.dart';

class AppBarAcionsContainer extends StatelessWidget {
  const AppBarAcionsContainer({
    Key? key,
    required this.icon,
    required this.ontap,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.light_green,
        ),
        child: Icon(
          icon,
          color: ColorConstants.primary_green,
        ),
      ),
    );
  }
}
