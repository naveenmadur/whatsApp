import 'package:flutter/material.dart';
import 'package:whats_app/constants/color_constants.dart';

class OtpContainer extends StatelessWidget {
  const OtpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 1,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ColorConstants.primary_green,
            )),
      ),
    );
  }
}
