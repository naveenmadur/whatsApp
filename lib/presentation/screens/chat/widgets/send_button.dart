// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whats_app/constants/color_constants.dart';
import 'package:whats_app/constants/decorations.dart';
import 'package:whats_app/constants/icon_constants.dart';
import 'package:whats_app/constants/paddings&margins.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  final VoidCallback onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: Decorations.sendButtonDecoration,
          padding: Paddings.sendButtonPadding,
          child: Icon(
            controller.text.isNotEmpty ? IconConstants.send : IconConstants.mic,
            color: ColorConstants.light_background,
          ),
        ),
      ),
    );
  }
}
