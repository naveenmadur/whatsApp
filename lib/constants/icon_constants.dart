import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';

class IconConstants {
  static const Icon more = Icon(
    Icons.more_vert,
    color: ColorConstants.primary_green,
  );

  static const Icon attachFile = Icon(
    Icons.attach_file,
  );

  static const Icon camera = Icon(
    Icons.camera_alt_outlined,
  );

  static const Icon smiley = Icon(Icons.tag_faces_outlined);
  static const Icon settings = const Icon(
    Icons.settings,
    color: ColorConstants.primary_green,
  );

  static const Icon logout = Icon(
    Icons.logout_outlined,
    color: ColorConstants.red,
  );

  static const Icon chevronRight = Icon(Icons.chevron_right);

  static const IconData send = Icons.send;
  static const IconData mic = Icons.mic;
  static const IconData person = Icons.person_outline;
  static const IconData chat = Icons.chat;
  static const IconData notifications = Icons.notifications_none_outlined;
  static const IconData security = Icons.security_outlined;
  static const IconData help = Icons.help_outline_rounded;
  static const IconData logoutData = Icons.logout_rounded;

  //! Icon Buttons:
  static IconButton appBarLeadingIcon({required VoidCallback onTap}) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: ColorConstants.primary_green,
      onPressed: onTap,
    );
  }
}
