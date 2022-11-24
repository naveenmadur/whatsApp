import 'package:flutter/material.dart';
import 'package:whats_app/constants/icon_constants.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconConstants.camera,
    );
  }
}
