// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/decorations.dart';
import 'package:whats_app/constants/paddings&margins.dart';

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
        constraints: BoxConstraints(maxHeight: 10),
        margin: Margins.appBarIconMargin,
        padding: Paddings.appBarIconPadding,
        decoration: Decorations.appBarIconBoxDecoration,
        child: Icon(
          icon,
          color: ColorConstants.primary_green,
        ),
      ),
    );
  }
}
