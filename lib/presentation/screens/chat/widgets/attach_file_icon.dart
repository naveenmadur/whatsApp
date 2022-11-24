import 'package:flutter/material.dart';
import 'package:whats_app/constants/icon_constants.dart';

class AttachFileIcon extends StatelessWidget {
  const AttachFileIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconConstants.attachFile,
    );
  }
}
