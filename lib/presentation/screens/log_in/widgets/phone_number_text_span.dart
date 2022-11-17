import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/constants/color_constants.dart';

class PhoneNumberTextSpan extends StatelessWidget {
  const PhoneNumberTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: '    Email address',
            style: TextStyle(
              fontSize: 15,
              color: ColorConstants.grey,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
