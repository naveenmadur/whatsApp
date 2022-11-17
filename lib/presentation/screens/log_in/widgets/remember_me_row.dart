import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/presentation/screens/log_in/widgets/green_checkbox.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
      child: Row(
        children: [
          GreenCheckbox(),
          Text(
            'Remember me',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
