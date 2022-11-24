import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';

class Decorations {
  static BoxDecoration appBarIconBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: ColorConstants.light_green,
  );

  static BoxDecoration sendButtonDecoration = BoxDecoration(
    color: ColorConstants.primary_green,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration chatDecoration(bool receiver) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: !receiver ? ColorConstants.light_grey : ColorConstants.light_green,
    );
  }
}
