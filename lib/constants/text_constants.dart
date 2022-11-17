import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/text_styles.dart';

class TextConstants {
  static const Text dontHaveAnAccount = Text(
    'Don\'t have an account?',
    style: TextStyle(
      color: ColorConstants.grey,
    ),
  );

  static const Text homeScreenAppBarText = Text(
    'WhatsUp',
    style: TextStyles.homescreenAppBarTextStyle,
  );
}
