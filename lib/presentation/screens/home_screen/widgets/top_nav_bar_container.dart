// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whats_app/constants/color_constants.dart';

class TopNavBarContainer extends StatelessWidget {
  const TopNavBarContainer({
    Key? key,
    required this.label,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          border: (isActive) ? Border(
            bottom: BorderSide(
                color: ColorConstants.primary_green,
                width: 3),
          ) : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 17,
            color: (isActive) ? ColorConstants.primary_green : ColorConstants.grey,
          ),
        ),
      ),
    );
  }
}
