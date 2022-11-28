// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/icon_constants.dart';

class ActionsContainer extends StatelessWidget {
  const ActionsContainer({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: (backgroundColor != null)
                  ? backgroundColor
                  : ColorConstants.light_green,
            ),
            child: Icon(iconData, size: 30),
          ),
          horizontalTitleGap: 30,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          iconColor:
              (iconColor != null) ? iconColor : ColorConstants.primary_green,
          title: Text(title),
          trailing: IconConstants.chevronRight,
        ),
      ),
    );
  }
}
